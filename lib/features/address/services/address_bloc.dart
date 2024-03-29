import 'package:dfunc/dfunc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:search_cep/search_cep.dart';

import '../models/address.dart';

part 'address_bloc.freezed.dart';

@freezed
class AddressEvent with _$AddressEvent {
  const factory AddressEvent.search(String zipCode) = _SearchEvent;
  const factory AddressEvent.initialize(AddressData? data) = _InitializeEvent;
}

@freezed
class AddressState with _$AddressState {
  const factory AddressState.none() = _Loading;
  const factory AddressState.editing(AddressData data) = _Editing;
}

@injectable
class AddressBloc extends Bloc<AddressEvent, AddressState> {
  AddressBloc({
    required ViaCepSearchCep cepClient,
  })  : _cepClient = cepClient,
        super(const AddressState.none()) {
    on<AddressEvent>(_eventHandler, transformer: _debounce(_duration));
  }

  final ViaCepSearchCep _cepClient;

  EventHandler<AddressEvent, AddressState> get _eventHandler =>
      (event, emit) => event.map(
            search: (event) => _searchCep(event, emit),
            initialize: (event) => _initialize(event, emit),
          );

  void _initialize(_InitializeEvent event, Emitter emit) {
    final data = event.data.ifNull(
      () => const AddressData(
        zipcode: '',
        street: '',
        number: '',
        additional: '',
        neighborhood: '',
        city: '',
        state: '',
      ),
    );

    emit(AddressState.editing(data));
  }

  Future<void> _searchCep(_SearchEvent event, Emitter emit) =>
      tryEitherAsync<AddressState?>(
        (bind) async {
          final response = await _cepClient.searchInfoByCep(cep: event.zipCode);
          final viaCep = response.fold((e) => throw Exception(e), identity);

          return state
              .whenOrNull(editing: identity)
              .maybeFlatMap((it) => it.merge(viaCep))
              .maybeFlatMap(AddressState.editing)
              .ifNull(() => state);
        },
      ).doOnRightAsync((it) => emit(it));
}

extension on AddressData {
  AddressData merge(ViaCepInfo viaCepInfo) => copyWith(
        zipcode: viaCepInfo.cep ?? zipcode,
        street: viaCepInfo.logradouro ?? street,
        number: viaCepInfo.complemento ?? number,
        neighborhood: viaCepInfo.bairro ?? neighborhood,
        city: viaCepInfo.localidade ?? city,
        state: viaCepInfo.uf ?? state,
      );
}

const _duration = Duration(milliseconds: 300);

EventTransformer<Event> _debounce<Event>(Duration duration) =>
    (events, mapper) => events.debounceTime(duration).switchMap(mapper);

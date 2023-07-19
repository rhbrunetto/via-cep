import 'package:dfunc/dfunc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:search_cep/search_cep.dart';

import '../data/uf_list.dart';
import '../models/address.dart';

part 'address_bloc.freezed.dart';

@freezed
class AddressEvent with _$AddressEvent {
  const factory AddressEvent.search(String cep) = _SearchEvent;
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
    required UfList ufList,
  })  : _cepClient = cepClient,
        _ufList = ufList,
        super(const AddressState.none()) {
    on<AddressEvent>(_eventHandler);
  }

  final ViaCepSearchCep _cepClient;
  final UfList _ufList;

  EventHandler<AddressEvent, AddressState> get _eventHandler =>
      (event, emit) => event.map(
            search: (event) => _searchCep(event, emit),
            initialize: (event) => _initialize(event, emit),
          );

  void _initialize(_InitializeEvent event, Emitter emit) {
    final data = event.data.ifNull(() => const AddressData());

    emit(AddressState.editing(data));
  }

  Future<void> _searchCep(_SearchEvent event, Emitter emit) =>
      tryEitherAsync<AddressState?>(
        (bind) async {
          final response = await _cepClient.searchInfoByCep(cep: event.cep);
          final viaCep = response.fold((e) => throw Exception(e), identity);

          return state
              .whenOrNull(editing: identity)
              .maybeFlatMap((it) => it.merge(viaCep, _ufList))
              .maybeFlatMap(AddressState.editing)
              .ifNull(() => state);
        },
      ).doOnRightAsync((it) => emit(it));
}

extension on AddressData {
  AddressData merge(ViaCepInfo viaCepInfo, UfList ufList) => copyWith(
        cep: viaCepInfo.cep ?? cep,
        logradouro: viaCepInfo.logradouro ?? logradouro,
        complemento: viaCepInfo.complemento ?? complemento,
        bairro: viaCepInfo.bairro ?? bairro,
        localidade: viaCepInfo.localidade ?? localidade,
        uf: viaCepInfo.uf?.let(ufList.findUfBySigla) ?? uf,
        unidade: viaCepInfo.unidade ?? unidade,
        ibge: viaCepInfo.ibge ?? ibge,
        gia: viaCepInfo.gia ?? gia,
      );
}

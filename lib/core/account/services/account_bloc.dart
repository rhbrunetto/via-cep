import 'package:bloc/bloc.dart';
import 'package:dfunc/dfunc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../data/account_repository.dart';
import '../models/account_data.dart';

part 'account_bloc.freezed.dart';

@freezed
sealed class AccountEvent with _$AccountEvent {
  const factory AccountEvent.load() = _LoadEvent;
  const factory AccountEvent.logout() = _LogoutEvent;
  const factory AccountEvent.register(String userId) = _RegisterEvent;
}

@freezed
sealed class AccountState with _$AccountState {
  const factory AccountState.none() = _None;
  const factory AccountState.processing() = _Processing;
  const factory AccountState.loaded(AccountData accountData) = _Loaded;
}

@injectable
class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountBloc({
    required AccountRepository repository,
  })  : _repository = repository,
        super(const AccountState.processing()) {
    on<AccountEvent>(_eventHandler);
  }

  final AccountRepository _repository;

  EventHandler<AccountEvent, AccountState> get _eventHandler =>
      (event, emit) => event.map(
            load: (_) => _loadAccount(emit),
            logout: (_) => _logout(emit),
            register: (event) => _registerAccount(event, emit),
          );

  Future<void> _logout(Emitter emit) async {
    await _repository.clear();
    emit(const AccountState.none());
  }

  Future<void> _registerAccount(_RegisterEvent event, Emitter emit) async {
    final registered = await _repository.setAccount(event.userId);

    if (registered) add(const AccountEvent.load());
  }

  Future<void> _loadAccount(Emitter emit) async {
    final account = await _repository.load();

    final newState = account
        .maybeFlatMap(AccountState.loaded)
        .ifNull(() => const AccountState.none());

    emit(newState);
  }
}

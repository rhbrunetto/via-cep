import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/account_repository.dart';
import '../models/account_data.dart';

part 'account_bloc.freezed.dart';

@freezed
sealed class AccountEvent with _$AccountEvent {
  const factory AccountEvent.load() = _LoadEvent;
  const factory AccountEvent.register(AccountData accountData) = _RegisterEvent;
}

@freezed
sealed class AccountState with _$AccountState {
  const factory AccountState.none() = _None;
  const factory AccountState.processing() = _Processing;
  const factory AccountState.loaded(AccountData accountData) = _Loaded;
}

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountBloc({
    required AccountRepository repository,
  })  : _repository = repository,
        super(const AccountState.processing()) {
    on<AccountEvent>(_eventHandler);
  }

  final AccountRepository _repository;

  EventHandler<AccountEvent, AccountState> get _eventHandler =>
      (event, emit) => event.map();
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../core/account/data/account_repository.dart';
import '../../../core/users/data/user_repository.dart';

part 'sign_in_bloc.freezed.dart';

@freezed
sealed class SignInEvent with _$SignInEvent {
  const factory SignInEvent.authenticate(String email, String password) =
      _AuthEvent;
}

@freezed
sealed class SignInState with _$SignInState {
  const factory SignInState.none() = _None;
  const factory SignInState.loading() = _Loading;
  const factory SignInState.failed() = _Failed;
  const factory SignInState.success() = _Success;
}

@injectable
class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc({
    required UserRepository userRepository,
    required AccountRepository accountRepository,
  })  : _userRepository = userRepository,
        _accountRepository = accountRepository,
        super(const SignInState.none()) {
    on<SignInEvent>(_eventHandler);
  }

  final UserRepository _userRepository;
  final AccountRepository _accountRepository;

  EventHandler<SignInEvent, SignInState> get _eventHandler =>
      (event, emit) => event.map(
            authenticate: (event) => _authenticate(event, emit),
          );

  Future<void> _authenticate(_AuthEvent event, Emitter emit) async {
    emit(const SignInState.loading());

    await Future.delayed(const Duration(seconds: 2));

    final match = await _userRepository.match(event.email, event.password);

    if (match == null) {
      emit(const SignInState.failed());
    } else {
      await _accountRepository.setAccount(match.id);
      emit(const SignInState.success());
    }
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../core/users/data/user_repository.dart';
import '../../../core/users/models/user.dart';

part 'sign_up_bloc.freezed.dart';

@freezed
sealed class SignUpEvent with _$SignUpEvent {
  const factory SignUpEvent.register(User user) = _RegisterEvent;
}

@freezed
sealed class SignUpState with _$SignUpState {
  const factory SignUpState.none() = _None;
  const factory SignUpState.loading() = _Loading;
  const factory SignUpState.failed() = _Failed;
  const factory SignUpState.success(String userId) = _Success;
}

@injectable
class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc({
    required UserRepository userRepository,
  })  : _userRepository = userRepository,
        super(const SignUpState.none()) {
    on<SignUpEvent>(_eventHandler);
  }

  final UserRepository _userRepository;

  EventHandler<SignUpEvent, SignUpState> get _eventHandler =>
      (event, emit) => event.map(
            register: (event) => _registerEvent(event, emit),
          );

  Future<void> _registerEvent(_RegisterEvent event, Emitter emit) async {
    emit(const SignUpState.loading());

    await Future.delayed(const Duration(seconds: 2));

    try {
      await _userRepository.register(event.user);
      emit(SignUpState.success(event.user.id));
    } on Exception {
      emit(const SignUpState.failed());
    }
  }
}

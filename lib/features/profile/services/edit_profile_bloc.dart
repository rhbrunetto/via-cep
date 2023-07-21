import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../core/users/data/user_repository.dart';

part 'edit_profile_bloc.freezed.dart';

@freezed
sealed class EditProfileEvent with _$EditProfileEvent {
  const factory EditProfileEvent.updatePassword(String password) =
      _UpdatePassword;
}

@freezed
sealed class EditProfileState with _$EditProfileState {
  const factory EditProfileState.none() = _None;
  const factory EditProfileState.loading() = _Loading;
  const factory EditProfileState.failed() = _Failed;
  const factory EditProfileState.success() = _Success;
}

@injectable
class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  EditProfileBloc({
    @factoryParam required String userId,
    required UserRepository userRepository,
  })  : _userRepository = userRepository,
        _userId = userId,
        super(const EditProfileState.none()) {
    on<EditProfileEvent>(_eventHandler);
  }

  final String _userId;
  final UserRepository _userRepository;

  EventHandler<EditProfileEvent, EditProfileState> get _eventHandler =>
      (event, emit) => event.map(
            updatePassword: (event) => _updatePassword(event, emit),
          );

  Future<void> _updatePassword(_UpdatePassword event, Emitter emit) async {
    emit(const EditProfileState.loading());

    await Future.delayed(const Duration(seconds: 2));

    try {
      await _userRepository.updatePassword(_userId, event.password);
      emit(const EditProfileState.success());
    } on Exception {
      emit(const EditProfileState.none());
    }
  }
}

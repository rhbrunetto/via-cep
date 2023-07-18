// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AccountData {
  String get userName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AccountDataCopyWith<AccountData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountDataCopyWith<$Res> {
  factory $AccountDataCopyWith(
          AccountData value, $Res Function(AccountData) then) =
      _$AccountDataCopyWithImpl<$Res, AccountData>;
  @useResult
  $Res call({String userName, String email});
}

/// @nodoc
class _$AccountDataCopyWithImpl<$Res, $Val extends AccountData>
    implements $AccountDataCopyWith<$Res> {
  _$AccountDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AccountDataCopyWith<$Res>
    implements $AccountDataCopyWith<$Res> {
  factory _$$_AccountDataCopyWith(
          _$_AccountData value, $Res Function(_$_AccountData) then) =
      __$$_AccountDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userName, String email});
}

/// @nodoc
class __$$_AccountDataCopyWithImpl<$Res>
    extends _$AccountDataCopyWithImpl<$Res, _$_AccountData>
    implements _$$_AccountDataCopyWith<$Res> {
  __$$_AccountDataCopyWithImpl(
      _$_AccountData _value, $Res Function(_$_AccountData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? email = null,
  }) {
    return _then(_$_AccountData(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AccountData implements _AccountData {
  const _$_AccountData({required this.userName, required this.email});

  @override
  final String userName;
  @override
  final String email;

  @override
  String toString() {
    return 'AccountData(userName: $userName, email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AccountData &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userName, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AccountDataCopyWith<_$_AccountData> get copyWith =>
      __$$_AccountDataCopyWithImpl<_$_AccountData>(this, _$identity);
}

abstract class _AccountData implements AccountData {
  const factory _AccountData(
      {required final String userName,
      required final String email}) = _$_AccountData;

  @override
  String get userName;
  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$_AccountDataCopyWith<_$_AccountData> get copyWith =>
      throw _privateConstructorUsedError;
}

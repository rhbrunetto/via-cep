import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_data.freezed.dart';

@freezed
class AccountData with _$AccountData {
  const factory AccountData({
    required String userName,
    required String email,
  }) = _AccountData;
}

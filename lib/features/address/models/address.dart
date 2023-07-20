import 'package:freezed_annotation/freezed_annotation.dart';

part 'address.freezed.dart';

@freezed
class Address with _$Address {
  const factory Address({
    required String id,
    required String userId,
    required DateTime created,
    required AddressData data,
  }) = _Address;
}

@freezed
class AddressData with _$AddressData {
  const factory AddressData({
    required String zipcode,
    required String street,
    required String? number,
    required String? additional,
    required String neighborhood,
    required String city,
    required String state,
  }) = _AddressData;
}

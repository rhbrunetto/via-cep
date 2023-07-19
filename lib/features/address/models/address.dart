import 'package:freezed_annotation/freezed_annotation.dart';

part 'address.freezed.dart';

@freezed
class Address with _$Address {
  const factory Address({
    required String id,
    required DateTime created,
    required AddressData data,
  }) = _Address;
}

@freezed
class AddressData with _$AddressData {
  const factory AddressData({
    required String cep,
    required String logradouro,
    required String complemento,
    required String bairro,
    required String localidade,
    required String uf,
    required String unidade,
    required String ibge,
    required String gia,
  }) = _AddressData;
}

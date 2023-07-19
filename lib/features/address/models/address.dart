import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/uf.dart';

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
    String? cep,
    String? logradouro,
    String? complemento,
    String? bairro,
    String? localidade,
    Uf? uf,
    String? unidade,
    String? ibge,
    String? gia,
  }) = _AddressData;
}

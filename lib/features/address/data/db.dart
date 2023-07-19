import 'package:drift/drift.dart';

import '../../../core/db/db.dart';
import '../models/address.dart';

class AddressRows extends Table {
  const AddressRows();

  TextColumn get id => text()();
  DateTimeColumn get created => dateTime()();
  TextColumn get cep => text()();
  TextColumn get logradouro => text()();
  TextColumn get complemento => text()();
  TextColumn get bairro => text()();
  TextColumn get localidade => text()();
  TextColumn get uf => text()();
  TextColumn get unidade => text()();
  TextColumn get ibge => text()();
  TextColumn get gia => text()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

extension AddressModelExt on AddressRow {
  Address toModel() => Address(
        id: id,
        created: created,
        data: AddressData(
          cep: cep,
          logradouro: logradouro,
          complemento: complemento,
          bairro: bairro,
          localidade: localidade,
          uf: uf,
          unidade: unidade,
          ibge: ibge,
          gia: gia,
        ),
      );
}

extension AddressRowExt on Address {
  AddressRow toDto() => AddressRow(
        id: id,
        created: created,
        cep: data.cep,
        logradouro: data.logradouro,
        complemento: data.complemento,
        bairro: data.bairro,
        localidade: data.localidade,
        uf: data.uf,
        unidade: data.unidade,
        ibge: data.ibge,
        gia: data.gia,
      );
}

import 'package:drift/drift.dart';

import '../../../core/db/db.dart';
import '../models/address.dart';
import 'uf_list.dart';

class AddressRows extends Table {
  const AddressRows();

  TextColumn get id => text()();
  DateTimeColumn get created => dateTime()();
  TextColumn get cep => text().nullable()();
  TextColumn get logradouro => text().nullable()();
  TextColumn get complemento => text().nullable()();
  TextColumn get bairro => text().nullable()();
  TextColumn get localidade => text().nullable()();
  TextColumn get uf => text().nullable()();
  TextColumn get unidade => text().nullable()();
  TextColumn get ibge => text().nullable()();
  TextColumn get gia => text().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

extension AddressModelExt on AddressRow {
  Address toModel(UfList ufList) => Address(
        id: id,
        created: created,
        data: AddressData(
          cep: cep,
          logradouro: logradouro,
          complemento: complemento,
          bairro: bairro,
          localidade: localidade,
          uf: ufList.findUfBySigla(uf),
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
        uf: data.uf.sigla,
        unidade: data.unidade,
        ibge: data.ibge,
        gia: data.gia,
      );
}

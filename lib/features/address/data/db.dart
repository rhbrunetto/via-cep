import 'package:drift/drift.dart';

import '../../../core/db/db.dart';
import '../../../core/users/data/db.dart';
import '../models/address.dart';

class AddressRows extends Table {
  const AddressRows();

  TextColumn get id => text()();
  DateTimeColumn get created => dateTime()();
  TextColumn get zipcode => text()();
  TextColumn get street => text()();
  TextColumn get additional => text().nullable()();
  TextColumn get number => text().nullable()();
  TextColumn get neighborhood => text()();
  TextColumn get city => text()();
  TextColumn get state => text()();
  TextColumn get userId => text().references(UserRows, #id)();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

extension AddressModelExt on AddressRow {
  Address toModel() => Address(
        id: id,
        userId: userId,
        created: created,
        data: AddressData(
          zipcode: zipcode,
          street: street,
          additional: additional,
          number: number,
          neighborhood: neighborhood,
          city: city,
          state: state,
        ),
      );
}

extension AddressRowExt on Address {
  AddressRow toDto() => AddressRow(
        id: id,
        userId: userId,
        created: created,
        zipcode: data.zipcode,
        street: data.street,
        additional: data.additional,
        number: data.number,
        neighborhood: data.neighborhood,
        city: data.city,
        state: data.state,
      );
}

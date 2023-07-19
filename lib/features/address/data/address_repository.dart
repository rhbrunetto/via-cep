import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:collection/collection.dart';

import '../../../core/db/db.dart';
import '../models/address.dart';
import 'db.dart';
import 'uf_list.dart';

@injectable
class AddressRepository {
  const AddressRepository(this._db, this._ufList);

  final AvaDatabase _db;
  final UfList _ufList;

  Stream<List<Address>> watchAll() {
    final query = _db.select(_db.addressRows)
      ..orderBy([(t) => OrderingTerm.desc(t.created)]);

    return query
        .map((row) => row.toModel(_ufList))
        .watch()
        .map((event) => event.whereNotNull().toList());
  }

  Future<void> save(Address address) async {
    await _db.into(_db.addressRows).insertOnConflictUpdate(address.toDto());
  }

  Future<void> delete(Address address) async {
    final query = _db.delete(_db.addressRows)
      ..where((row) => row.id.equals(address.id));

    await query.go();
  }
}

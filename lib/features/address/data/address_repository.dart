import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:collection/collection.dart';

import '../../../core/db/db.dart';
import '../models/address.dart';
import 'db.dart';

@injectable
class AddressRepository {
  const AddressRepository(this._db);

  final AvaDatabase _db;

  Stream<List<Address>> watchAll(String userId) {
    final query = _db.select(_db.addressRows)
      ..where((tbl) => tbl.userId.equals(userId))
      ..orderBy([(t) => OrderingTerm.desc(t.created)]);

    return query
        .map((row) => row.toModel())
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

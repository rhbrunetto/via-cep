import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

import '../../db/db.dart';
import '../models/account_data.dart';

@injectable
class AccountRepository {
  const AccountRepository(this._db);

  final AvaDatabase _db;

  Future<AccountData?> load() async {
    final query = _db.select(_db.accountRows);

    return query.getSingleOrNull().then((row) => row?.toModel());
  }

  Future<void> save(AccountData account) async {
    await _db.into(_db.accountRows).insertOnConflictUpdate(account.toDto());
  }

  Future<void> clear() async {
    await _db.delete(_db.accountRows).go();
  }
}

// This can be moved to a local datasource if we go full clean-arch
class AccountRows extends Table {
  const AccountRows();

  TextColumn get name => text()();
  TextColumn get email => text()();
}

extension on AccountRow {
  AccountData toModel() => AccountData(userName: name, email: email);
}

extension on AccountData {
  AccountRow toDto() => AccountRow(name: userName, email: email);
}

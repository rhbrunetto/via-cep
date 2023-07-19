import 'package:injectable/injectable.dart';

import '../../db/db.dart';
import '../models/account_data.dart';
import 'db.dart';

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

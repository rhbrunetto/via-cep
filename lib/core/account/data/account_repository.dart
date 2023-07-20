import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

import '../../db/db.dart';
import '../models/account_data.dart';
import 'db.dart';

@injectable
class AccountRepository {
  const AccountRepository(this._db, this._storage);

  final AvaDatabase _db;
  final FlutterSecureStorage _storage;

  Future<AccountData?> load() async {
    final userId = await _storage.read(key: _key);
    if (userId == null) return null;

    return _select(userId).then((it) => it?.toAccount());
  }

  Future<bool> setAccount(String userId) async {
    final exists = await _select(userId) != null;
    if (!exists) return false;

    await _storage.write(key: _key, value: userId);
    return true;
  }

  Future<void> clear() async {
    await _storage.deleteAll();
  }

  Future<UserRow?> _select(String userId) async {
    final query = _db.select(_db.userRows)
      ..where((tbl) => tbl.id.equals(userId));

    return query.getSingleOrNull();
  }
}

const _key = 'user_id';

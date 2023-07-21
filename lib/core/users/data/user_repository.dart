import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

import '../../db/db.dart';
import '../../password_hasher.dart';
import '../models/user.dart';
import 'db.dart';

@injectable
class UserRepository {
  const UserRepository(this._db, this._hasher);

  final AvaDatabase _db;
  final PasswordHasher _hasher;

  Future<User?> match(String email, String password) async {
    final hash = _hasher.hash(password);
    final query = _db.select(_db.userRows)
      ..where((tbl) => tbl.email.equals(email))
      ..where((tbl) => tbl.password.equals(hash));

    return query.getSingleOrNull().then((row) => row?.toModel());
  }

  Future<void> register(User user) async {
    final updated = user.copyWith(
      password: _hasher.hash(user.password),
    );

    await _db.into(_db.userRows).insert(updated.toDto());
  }

  Future<void> updatePassword(String id, String password) async {
    final query = _db.update(_db.userRows)..where((tbl) => tbl.id.equals(id));

    await query.write(UserRowsCompanion(password: Value(password)));
  }
}

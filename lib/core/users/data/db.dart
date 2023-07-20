import 'package:drift/drift.dart';
import '../../db/db.dart';
import '../models/user.dart';

class UserRows extends Table {
  const UserRows();

  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get email => text().unique()();
  TextColumn get password => text()();

  @override
  Set<Column> get primaryKey => {id};
}

extension UserRowExt on UserRow {
  User toModel() => User(
        id: id,
        userName: name,
        email: email,
        password: password,
      );
}

extension UserExt on User {
  UserRow toDto() => UserRow(
        id: id,
        name: userName,
        email: email,
        password: password,
      );
}

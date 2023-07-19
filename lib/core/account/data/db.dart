import 'package:drift/drift.dart';
import '../../db/db.dart';
import '../models/account_data.dart';

class AccountRows extends Table {
  const AccountRows();

  TextColumn get name => text()();
  TextColumn get email => text()();
}

extension AccountRowExt on AccountRow {
  AccountData toModel() => AccountData(userName: name, email: email);
}

extension AccountDataExt on AccountData {
  AccountRow toDto() => AccountRow(name: userName, email: email);
}

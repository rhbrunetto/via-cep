import '../../db/db.dart';
import '../models/account_data.dart';

extension AccountRowExt on UserRow {
  AccountData toAccount() => AccountData(
        userName: name,
        email: email,
        userId: id,
      );
}

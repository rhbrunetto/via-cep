import 'package:crypt/crypt.dart';
import 'package:injectable/injectable.dart';

abstract class PasswordHasher {
  String hash(String password);
}

@injectable
class PasswordHashImpl extends PasswordHasher {
  @override
  String hash(String password) =>
      Crypt.sha256(password, salt: _salt, rounds: _rounds).toString();
}

const _salt = 'banana';
const _rounds = 2;

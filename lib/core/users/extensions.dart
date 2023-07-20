import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import 'models/user.dart';

extension UserExt on BuildContext {
  User generateUser(
    String name,
    String email,
    String password,
  ) =>
      User(
        id: const Uuid().v4(),
        userName: name,
        email: email,
        password: password,
      );
}

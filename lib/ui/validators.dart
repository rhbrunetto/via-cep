import 'package:flutter/material.dart';

import '../l10n/l10n.dart';

typedef Validator = String? Function(String?);

// TODO(rhbrunetto): refactor to strategy/decorator
extension ValidatorExt on BuildContext {
  Validator requiredValidator() =>
      (it) => it == null || it.isEmpty ? l10n.validatorRequired : null;

  Validator minCharValidator(int length) => (it) {
        if (it == null) return null;
        if (it.length >= length) return null;

        return l10n.validatorMinChar(length);
      };
}

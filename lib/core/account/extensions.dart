import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'services/account_bloc.dart';

extension AccountModuleExt on BuildContext {
  void refreshAccount(String userId) =>
      read<AccountBloc>()..add(AccountEvent.register(userId));
}

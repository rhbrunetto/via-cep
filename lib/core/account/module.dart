import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nested/nested.dart';

import '../../di.dart';
import 'services/account_bloc.dart';

class AccountModule extends SingleChildStatelessWidget {
  const AccountModule({super.key, super.child});

  @override
  Widget buildWithChild(BuildContext context, Widget? child) =>
      BlocProvider<AccountBloc>(
        create: (context) => sl<AccountBloc>()..add(const AccountEvent.load()),
        child: child,
      );
}

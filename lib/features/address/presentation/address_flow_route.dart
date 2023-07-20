import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../core/account/models/account_data.dart';
import '../../../core/account/services/account_bloc.dart';

@RoutePage()
class AddressFlowScreen extends StatelessWidget {
  const AddressFlowScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocBuilder<AccountBloc, AccountState>(
        builder: (context, state) => state.maybeWhen(
          loaded: (data) => Provider<AccountData>.value(
            value: data,
            child: const AutoRouter(),
          ),
          orElse: () => const SizedBox.shrink(),
        ),
      );
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/account/extensions.dart';
import '../../../di.dart';
import '../services/sign_up_bloc.dart';

@RoutePage()
class SignUpFlowScreen extends StatelessWidget {
  const SignUpFlowScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider<SignUpBloc>(
        create: (context) => sl<SignUpBloc>(),
        child: BlocListener<SignUpBloc, SignUpState>(
          listener: (context, state) => state.whenOrNull(
            success: context.refreshAccount,
          ),
          child: const AutoRouter(),
        ),
      );
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../di.dart';
import '../services/sign_in_bloc.dart';

@RoutePage()
class SignInFlowScreen extends StatelessWidget {
  const SignInFlowScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider<SignInBloc>(
        create: (context) => sl<SignInBloc>(),
        child: Builder(
          builder: (context) => const AutoRouter(),
        ),
      );
}

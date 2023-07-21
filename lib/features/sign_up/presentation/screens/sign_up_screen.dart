import 'package:auto_route/auto_route.dart';
import 'package:dfunc/dfunc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/users/extensions.dart';
import '../../../../l10n/l10n.dart';
import '../../../../ui/user_form.dart';
import '../../services/sign_up_bloc.dart';
import '../../../../ui/snackbar.dart';

@RoutePage()
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: BackButton(onPressed: () => context.router.pop()),
        ),
        body: BlocConsumer<SignUpBloc, SignUpState>(
          listener: (context, state) => state.whenOrNull(
            failed: () => showErrorSnackBar(context, context.l10n.signUpFailed),
          ),
          builder: (context, state) => SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.l10n.signUp,
                          style: const TextStyle(
                            fontSize: 48.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          context.l10n.signUpDesc,
                          style: const TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                  UserForm(
                    loading: state.maybeWhen(orElse: F, loading: T),
                    onSubmit: (name, email, pass) =>
                        context.read<SignUpBloc>().add(
                              SignUpEvent.register(
                                context.generateUser(name, email, pass),
                              ),
                            ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}

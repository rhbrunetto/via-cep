import 'package:auto_route/auto_route.dart';
import 'package:dfunc/dfunc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../l10n/l10n.dart';
import '../../../../routes.gr.dart';
import '../../../../ui/logo.dart';
import '../../services/sign_in_bloc.dart';
import '../widgets/sign_in_form.dart';
import '../../../../ui/snackbar.dart';

@RoutePage()
class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: BlocConsumer<SignInBloc, SignInState>(
          listener: (context, state) => state.whenOrNull(
            failed: () => showErrorSnackBar(context, context.l10n.signInFailed),
          ),
          builder: (context, state) => SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 64.0),
                    child: AvaLogo(),
                  ),
                  SignInForm(
                    loading: state.maybeWhen(orElse: F, loading: T),
                    onSubmit: (email, pass) => context
                        .read<SignInBloc>()
                        .add(SignInEvent.authenticate(email, pass)),
                  ),
                  const SizedBox(height: 24.0),
                  const _Register(),
                ],
              ),
            ),
          ),
        ),
      );
}

class _Register extends StatelessWidget {
  const _Register();

  @override
  Widget build(BuildContext context) => Center(
        child: Text.rich(
          TextSpan(
            text: context.l10n.signUpMessage,
            children: [
              WidgetSpan(
                child: InkWell(
                  onTap: () => context.router.push(const SignUpFlowRoute()),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      context.l10n.signUpCTA,
                      style:
                          const TextStyle(decoration: TextDecoration.underline),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}

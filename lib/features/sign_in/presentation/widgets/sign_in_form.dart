import 'package:flutter/material.dart';
import 'package:dfunc/dfunc.dart';
import '../../../../l10n/l10n.dart';
import '../../../../ui/colors.dart';
import '../../../../ui/textfield.dart';
import '../../../../ui/validators.dart';

typedef SignInFormCallback = void Function(String email, String password);

class SignInForm extends StatefulWidget {
  const SignInForm({
    super.key,
    required this.loading,
    required this.onSubmit,
  });

  final bool loading;
  final SignInFormCallback onSubmit;

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _onSubmit() {
    final valid = _formKey.currentState?.validate() ?? false;
    if (!valid) return;

    widget.onSubmit(_emailController.text, _passwordController.text);
  }

  @override
  Widget build(BuildContext context) => Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AvaTextField(
              controller: _emailController,
              label: context.l10n.email,
              hint: context.l10n.emailHint,
              validators: [
                context.requiredValidator(),
                context.emailValidator(),
              ],
            ),
            AvaTextField(
              controller: _passwordController,
              label: context.l10n.password,
              inputType: TextInputType.visiblePassword,
              validators: [
                context.requiredValidator(),
                context.minCharValidator(8),
              ],
            ),
            const SizedBox(height: 48),
            widget.loading
                ? const CircularProgressIndicator()
                : SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _onSubmit,
                      child: Text(context.l10n.signIn),
                    ),
                  ),
          ],
        ),
      );
}

import 'package:flutter/material.dart';
import '../../../../l10n/l10n.dart';
import '../../../../ui/textfield.dart';
import '../../../../ui/validators.dart';

typedef UserCallback = void Function(
  String name,
  String email,
  String password,
);

class UserForm extends StatefulWidget {
  const UserForm({
    super.key,
    required this.loading,
    required this.onSubmit,
  });

  final bool loading;
  final UserCallback onSubmit;

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordMatchController = TextEditingController();

  void _onSubmit() {
    final valid = _formKey.currentState?.validate() ?? false;
    if (!valid) return;

    widget.onSubmit(
      _nameController.text,
      _emailController.text,
      _passwordController.text,
    );
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
              controller: _nameController,
              label: context.l10n.name,
              hint: context.l10n.nameHint,
              validators: [
                context.requiredValidator(),
                context.countValidator(2),
              ],
            ),
            AvaTextField(
              controller: _emailController,
              label: context.l10n.email,
              hint: context.l10n.emailHint,
              validators: [
                context.requiredValidator(),
                context.emailValidator(),
              ],
            ),
            ValueListenableBuilder(
              valueListenable: _passwordController,
              builder: (context, value, _) => AvaTextField(
                controller: _passwordController,
                label: context.l10n.password,
                validators: [
                  context.requiredValidator(),
                  context.minCharValidator(8),
                  context.matchValidator(value.text),
                ],
              ),
            ),
            ValueListenableBuilder(
              valueListenable: _passwordController,
              builder: (context, value, _) => AvaTextField(
                controller: _passwordMatchController,
                label: context.l10n.passwordRepeat,
                validators: [
                  context.requiredValidator(),
                  context.minCharValidator(8),
                  context.matchValidator(value.text),
                ],
              ),
            ),
            const SizedBox(height: 48),
            widget.loading
                ? const CircularProgressIndicator()
                : SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _onSubmit,
                      child: Text(context.l10n.save),
                    ),
                  ),
          ],
        ),
      );
}

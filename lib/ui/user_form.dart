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
    this.userName,
    this.userEmail,
  });

  final String? userName;
  final String? userEmail;
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

  @override
  void initState() {
    super.initState();
    _updateFields();
  }

  @override
  void didUpdateWidget(covariant UserForm oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.userEmail != widget.userEmail ||
        oldWidget.userName != widget.userName) {
      _updateFields();
    }
  }

  void _updateFields() {
    _nameController.text = widget.userName ?? '';
    _emailController.text = widget.userEmail ?? '';
  }

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
              enabled: widget.userName == null,
              validators: [
                context.requiredValidator(),
                context.countValidator(2),
              ],
            ),
            AvaTextField(
              controller: _emailController,
              label: context.l10n.email,
              hint: context.l10n.emailHint,
              enabled: widget.userEmail == null,
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
                isPassword: true,
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
                isPassword: true,
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

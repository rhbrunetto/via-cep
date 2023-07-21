import 'package:auto_route/auto_route.dart';
import 'package:dfunc/dfunc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/account/models/account_data.dart';
import '../../../../l10n/l10n.dart';
import '../../../../ui/user_form.dart';
import '../../services/edit_profile_bloc.dart';
import '../../../../ui/snackbar.dart';

@RoutePage()
class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: BackButton(onPressed: () => context.router.pop()),
        ),
        body: BlocConsumer<EditProfileBloc, EditProfileState>(
          listener: (context, state) => state.whenOrNull(
            failed: () =>
                showErrorSnackBar(context, context.l10n.editProfileFailed),
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
                          context.l10n.changePasswordMessage,
                          style: const TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                  UserForm(
                    userName: context.read<AccountData>().userName,
                    userEmail: context.read<AccountData>().email,
                    loading: state.maybeWhen(orElse: F, loading: T),
                    onSubmit: (_, __, pass) => context
                        .read<EditProfileBloc>()
                        .add(EditProfileEvent.updatePassword(pass)),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}

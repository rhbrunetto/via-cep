import 'package:flutter/material.dart';

import '../../../../l10n/l10n.dart';
import '../../../../ui/colors.dart';

class AvaDrawer extends StatelessWidget {
  const AvaDrawer({
    super.key,
    required this.userName,
    required this.userEmail,
    required this.onChangePassword,
    required this.onLogout,
  });

  final String userName;
  final String userEmail;
  final VoidCallback onChangePassword;
  final VoidCallback onLogout;

  @override
  Widget build(BuildContext context) => Drawer(
        backgroundColor: AvaColors.platinum,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 24.0,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.l10n.helloUser(userName),
                      style: const TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(userEmail),
                  ],
                ),
              ),
              const SizedBox(height: 8.0),
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  ListTile(
                    leading: const Icon(Icons.edit),
                    title: Text(context.l10n.changePassword),
                    onTap: onChangePassword,
                  ),
                  ListTile(
                    leading: const Icon(Icons.logout),
                    title: Text(context.l10n.logout),
                    onTap: onLogout,
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}

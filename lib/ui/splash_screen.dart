import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../gen/assets.gen.dart';
import '../l10n/l10n.dart';
import 'colors.dart';
import 'logo.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) => Material(
        color: AvaColors.platinum,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AvaLogo(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: Text(
                context.l10n.title,
                style: const TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
      );
}

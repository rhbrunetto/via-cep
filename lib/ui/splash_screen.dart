import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../gen/assets.gen.dart';
import 'colors.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) => Material(
        color: AvaColors.platinum,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Assets.icons.flutterLogo.svg(alignment: Alignment.center),
            ),
            const Align(
              alignment: Alignment(0, -0.7),
              child: Text(
                'Ava Addresses',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
      );
}

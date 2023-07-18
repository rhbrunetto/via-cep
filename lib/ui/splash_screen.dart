import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../gen/assets.gen.dart';
import 'colors.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: const BoxDecoration(
          color: AvaColors.navy,
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Assets.icons.flutterLogo
                  .svg(alignment: Alignment.bottomCenter),
            ),
            const Align(
              alignment: Alignment(0, -0.7),
              child: Text('...'),
            ),
          ],
        ),
      );
}

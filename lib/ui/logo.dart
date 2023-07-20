import 'package:flutter/material.dart';

import '../gen/assets.gen.dart';

class AvaLogo extends StatelessWidget {
  const AvaLogo({super.key});

  @override
  Widget build(BuildContext context) => Hero(
        tag: 'avalogo',
        child: Assets.icons.flutterLogo.svg(),
      );
}

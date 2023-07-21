import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/account/models/account_data.dart';
import '../../../di.dart';
import '../services/edit_profile_bloc.dart';

@RoutePage()
class ProfileFlowScreen extends StatelessWidget {
  const ProfileFlowScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider<EditProfileBloc>(
        create: (context) => sl<EditProfileBloc>(
          param1: context.read<AccountData>().userId,
        ),
        child: const AutoRouter(),
      );
}

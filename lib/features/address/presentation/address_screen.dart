import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../di.dart';
import '../services/address_bloc.dart';

@RoutePage()
class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _State();
}

class _State extends State<AddressScreen> {
  @override
  Widget build(BuildContext context) => Provider(
        create: (context) => sl<AddressBloc>(),
        child: const AutoRouter(),
      );
}

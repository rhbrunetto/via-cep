import 'package:auto_route/auto_route.dart';
import 'package:dfunc/dfunc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../di.dart';
import '../../models/address.dart';
import '../../services/address_bloc.dart';
import '../widgets/address_form.dart';

@RoutePage<AddressData>()
class AddressFormScreen extends StatelessWidget {
  const AddressFormScreen({
    super.key,
    this.data,
  });

  final AddressData? data;

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) =>
            sl<AddressBloc>()..add(AddressEvent.initialize(data)),
        child: Scaffold(
          appBar: AppBar(),
          body: BlocBuilder<AddressBloc, AddressState>(
            builder: (context, state) => state.map(
              none: always(Container()),
              editing: (state) => AddressForm(
                data: state.data,
                onCep: (cep) =>
                    context.read<AddressBloc>().add(AddressEvent.search(cep)),
                onSubmit: (data) => context.router.pop(data),
              ),
            ),
          ),
        ),
      );
}

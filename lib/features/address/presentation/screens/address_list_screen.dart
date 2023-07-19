import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../di.dart';
import '../../../../l10n/l10n.dart';
import '../../../../ui/colors.dart';
import '../../data/address_repository.dart';
import '../../models/address.dart';
import '../extensions.dart';
import '../widgets/address_card.dart';

@RoutePage()
class AddressListScreen extends StatefulWidget {
  const AddressListScreen({super.key});

  @override
  State<AddressListScreen> createState() => _State();
}

class _State extends State<AddressListScreen> {
  late final Stream<List<Address>> _stream;

  @override
  void initState() {
    super.initState();
    _stream = sl<AddressRepository>().watchAll();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(context.l10n.myAddresses),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add, color: AvaColors.ghostWhite),
          onPressed: () => context.createAddress(),
        ),
        body: StreamBuilder(
          stream: _stream,
          builder: (context, snapshot) {
            final addresses = snapshot.data;

            if (addresses == null) return const SizedBox.shrink();

            return ListView.builder(
              itemCount: addresses.length,
              itemBuilder: (context, index) => AddressCard(
                address: addresses.elementAt(index),
                onEdit: context.editAddress,
                onDelete: context.deleteAddress,
              ),
            );
          },
        ),
      );
}

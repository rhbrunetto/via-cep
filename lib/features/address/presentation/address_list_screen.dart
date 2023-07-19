import 'package:auto_route/auto_route.dart';
import 'package:dfunc/dfunc.dart';
import 'package:flutter/material.dart';

import '../../../di.dart';
import '../../../routes.gr.dart';
import '../data/address_repository.dart';
import '../models/address.dart';
import 'extensions.dart';

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
          title: Text('Address'),
          actions: [
            IconButton(
              onPressed: () => context.createAddress(),
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        body: StreamBuilder(
          stream: _stream,
          builder: (context, snapshot) {
            final addresses = snapshot.data;

            if (addresses == null) return const SizedBox.shrink();

            return ListView.builder(
              itemCount: addresses.length,
              itemBuilder: (context, index) {
                final address = addresses.elementAt(index);

                return ListTile(
                  title: Text(addresses.elementAt(index).data.logradouro),
                  onTap: () => context.editAddress(address),
                );
              },
            );
          },
        ),
      );
}

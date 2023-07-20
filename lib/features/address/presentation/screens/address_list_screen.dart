import 'package:auto_route/auto_route.dart';
import 'package:dfunc/dfunc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/account/extensions.dart';
import '../../../../core/account/models/account_data.dart';
import '../../../../di.dart';
import '../../../../l10n/l10n.dart';
import '../../../../ui/colors.dart';
import '../../../../ui/drawer.dart';
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
    final userId = context.read<AccountData>().userId;
    _stream = sl<AddressRepository>().watchAll(userId);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(context.l10n.myAddresses),
        ),
        drawer: AvaDrawer(
          userName: context.read<AccountData>().userName.split(' ').first,
          userEmail: context.read<AccountData>().email,
          onChangePassword: ignore,
          onLogout: () => context.logout(),
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
            if (addresses.isEmpty) return const _EmptyListWidget();

            return ListView.builder(
              padding: const EdgeInsets.all(8.0),
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

class _EmptyListWidget extends StatelessWidget {
  const _EmptyListWidget();

  @override
  Widget build(BuildContext context) => Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text.rich(
            TextSpan(
              text: context.l10n.emptyAddresses,
              children: [
                const TextSpan(text: '\n\n'),
                TextSpan(text: context.l10n.emptyAddressCTA),
              ],
            ),
            textAlign: TextAlign.center,
            style: const TextStyle(color: AvaColors.outerSpace),
          ),
        ),
      );
}

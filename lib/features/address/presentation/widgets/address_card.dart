import 'package:flutter/material.dart';

import '../../models/address.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({
    super.key,
    required this.address,
    required this.onEdit,
    required this.onDelete,
  });

  final Address address;
  final ValueSetter<Address> onEdit;
  final ValueSetter<Address> onDelete;

  @override
  Widget build(BuildContext context) => Card(
        child: ListTile(
          title: Text(address.data.logradouro),
          subtitle: Text(address.data.bairro),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () => onEdit(address),
                icon: const Icon(Icons.edit),
              ),
              IconButton(
                onPressed: () => onDelete(address),
                icon: const Icon(Icons.delete),
              ),
            ],
          ),
        ),
      );
}

import 'package:flutter/material.dart';

import '../../../../l10n/l10n.dart';
import '../../../../ui/colors.dart';
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
  Widget build(BuildContext context) {
    final zipCode = address.data.zipcode;
    final street = address.data.street;
    final number = address.data.number;
    final neighborhood = address.data.neighborhood;
    final additional = address.data.additional;
    final city = address.data.city;
    final uf = address.data.state;

    final title = [
      street,
      if (number != null && number.isNotEmpty) number,
    ].join(', ');
    final subtitle = [
      if (additional != null && additional.isNotEmpty) additional,
      neighborhood,
    ].join(', ');
    final desc = '$city - $uf $zipCode';

    return Card(
      child: InkWell(
        onTap: () => onEdit(address),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(title, maxLines: 2, style: _titleStyle),
                  ),
                  IconButton(
                    onPressed: () => _showOptionsBottomsheet(
                      context: context,
                      onEdit: () => onEdit(address),
                      onDelete: () => onDelete(address),
                    ),
                    icon: const Icon(Icons.more_vert),
                  ),
                ],
              ),
              const SizedBox(height: 4.0),
              Text(subtitle, style: _subTitleStyle),
              const SizedBox(height: 8.0),
              Text(desc, style: _subTitleStyle),
              const SizedBox(height: 8.0),
            ],
          ),
        ),
      ),
    );
  }
}

const _titleStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
);

const _subTitleStyle = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w500,
);

void _showOptionsBottomsheet({
  required BuildContext context,
  required VoidCallback onEdit,
  required VoidCallback onDelete,
}) =>
    showModalBottomSheet(
      context: context,
      enableDrag: false,
      builder: (context) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.delete, color: Colors.red[800]),
                title: Text(
                  context.l10n.deleteAddress,
                  style: TextStyle(color: Colors.red[800]),
                ),
                onTap: () {
                  onDelete();
                  Navigator.of(context).pop();
                },
              ),
              const Divider(color: AvaColors.outerSpace),
              ListTile(
                leading: const Icon(Icons.edit),
                title: Text(context.l10n.editAddress),
                onTap: () {
                  onEdit();
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
        ),
      ),
    );

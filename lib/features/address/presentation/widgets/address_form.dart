import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../../l10n/l10n.dart';
import '../../../../ui/autocomplete.dart';
import '../../../../ui/textfield.dart';
import '../../../../ui/validators.dart';
import '../../models/address.dart';
import '../../models/uf.dart';

class AddressForm extends StatefulWidget {
  const AddressForm({
    super.key,
    required this.data,
    required this.onZipCode,
    required this.onSubmit,
  });

  final AddressData? data;
  final ValueSetter<String> onZipCode;
  final ValueSetter<AddressData> onSubmit;

  @override
  State<AddressForm> createState() => _AddressFormState();
}

class _AddressFormState extends State<AddressForm> {
  final _formKey = GlobalKey<FormState>();
  final _zipcodeController = TextEditingController();
  final _streetController = TextEditingController();
  final _additionalController = TextEditingController();
  final _numberController = TextEditingController();
  final _neighborhoodController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  final _zipCodeFormatter = MaskTextInputFormatter(mask: '#####-###');

  @override
  void initState() {
    super.initState();
    final data = widget.data;
    if (data != null) _update(data);
    _zipcodeController.addListener(_onZipCodeUpdate);
  }

  @override
  void dispose() {
    super.dispose();
    _zipcodeController.removeListener(_onZipCodeUpdate);
  }

  @override
  void didUpdateWidget(covariant AddressForm oldWidget) {
    super.didUpdateWidget(oldWidget);
    final data = widget.data;
    if (data != null && oldWidget.data != data) _update(data);
  }

  void _update(AddressData data) {
    if (data.zipcode != _zipcodeController.text) {
      _zipcodeController.update(data.zipcode);
    }
    _streetController.update(data.street);
    _additionalController.update(data.additional);
    _numberController.update(data.number);
    _neighborhoodController.update(data.neighborhood);
    _cityController.update(data.city);
    _stateController.update(data.state);
  }

  void _onZipCodeUpdate() {
    final zipCode = _zipCodeFormatter.unmaskText(_zipcodeController.text);
    if (_zipCodeFormatter.isFill()) widget.onZipCode(zipCode);
  }

  void _onSubmit() {
    final valid = _formKey.currentState?.validate() ?? false;
    if (!valid) return;

    widget.onSubmit(
      AddressData(
        zipcode: _zipcodeController.text,
        street: _streetController.text,
        additional: _additionalController.text,
        number: _numberController.text,
        neighborhood: _neighborhoodController.text,
        city: _cityController.text,
        state: _stateController.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            shrinkWrap: true,
            children: [
              AvaTextField(
                controller: _zipcodeController,
                label: context.l10n.zipcode,
                hint: context.l10n.zipcodeHint,
                validators: [context.requiredValidator()],
                inputFormatters: [_zipCodeFormatter],
                inputType: TextInputType.number,
                autoFocus: true,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 3,
                    child: AvaTextField(
                      controller: _streetController,
                      label: context.l10n.street,
                      hint: context.l10n.streetHint,
                      validators: [context.requiredValidator()],
                      inputType: TextInputType.streetAddress,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    flex: 1,
                    child: AvaTextField(
                      controller: _numberController,
                      hint: context.l10n.numberHint,
                      label: context.l10n.number,
                      inputType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              AvaTextField(
                controller: _additionalController,
                label: context.l10n.additional,
                hint: context.l10n.additionalHint,
              ),
              AvaTextField(
                controller: _neighborhoodController,
                label: context.l10n.neighborhood,
                validators: [context.requiredValidator()],
                hint: context.l10n.neighborhoodHint,
              ),
              Row(
                children: [
                  Flexible(
                    flex: 3,
                    child: AvaTextField(
                      controller: _cityController,
                      label: context.l10n.city,
                      hint: context.l10n.cityHint,
                      validators: [context.requiredValidator()],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    flex: 1,
                    child: AvaAutocomplete(
                      controller: _stateController,
                      label: context.l10n.state,
                      enforceOption: Uf.values.map((it) => it.sigla),
                      suggestionBuilder: (it) => Uf.values
                          .where((e) =>
                              e.sigla.toLowerCase().contains(it) ||
                              e.nome.toLowerCase().contains(it))
                          .map((it) => it.sigla),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: _onSubmit,
                child: Text(context.l10n.save),
              ),
            ],
          ),
        ),
      );
}

extension on TextEditingController {
  void update(String? text) => text != null ? this.text = text : null;
}

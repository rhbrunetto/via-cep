import 'package:flutter/material.dart';

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
    required this.onCep,
    required this.onSubmit,
  });

  final AddressData? data;
  final ValueSetter<String> onCep;
  final ValueSetter<AddressData> onSubmit;

  @override
  State<AddressForm> createState() => _AddressFormState();
}

class _AddressFormState extends State<AddressForm> {
  final _formKey = GlobalKey<FormState>();
  final _cepController = TextEditingController();
  final _logradouroController = TextEditingController();
  final _complementoController = TextEditingController();
  final _bairroController = TextEditingController();
  final _localidadeController = TextEditingController();
  final _ufController = TextEditingController();
  final _unidadeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final data = widget.data;
    if (data != null) _update(data);
  }

  @override
  void didUpdateWidget(covariant AddressForm oldWidget) {
    super.didUpdateWidget(oldWidget);
    final data = widget.data;
    if (data != null && oldWidget.data != data) _update(data);
  }

  void _update(AddressData data) {
    _cepController.update(data.cep);
    _logradouroController.update(data.logradouro);
    _complementoController.update(data.complemento);
    _bairroController.update(data.bairro);
    _localidadeController.update(data.localidade);
    _ufController.update(data.uf);
    _unidadeController.update(data.unidade);
  }

  void _onSubmit() {
    final valid = _formKey.currentState?.validate() ?? false;
    if (!valid) return;

    widget.onSubmit(
      AddressData(
        cep: _cepController.text,
        logradouro: _logradouroController.text,
        complemento: _complementoController.text,
        bairro: _bairroController.text,
        localidade: _localidadeController.text,
        uf: _ufController.text,
        unidade: _unidadeController.text,
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
                controller: _cepController,
                label: context.l10n.cep,
                validators: [
                  context.requiredValidator(),
                ],
                // onChanged: widget.onCep,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 3,
                    child: AvaTextField(
                      controller: _logradouroController,
                      label: context.l10n.logradouro,
                      validators: [
                        context.requiredValidator(),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    flex: 1,
                    child: AvaTextField(
                      controller: _complementoController,
                      label: context.l10n.complemento,
                    ),
                  ),
                ],
              ),
              AvaTextField(
                controller: _bairroController,
                label: context.l10n.bairro,
              ),
              Row(
                children: [
                  Flexible(
                    flex: 3,
                    child: AvaTextField(
                      controller: _localidadeController,
                      label: context.l10n.localidade,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    flex: 1,
                    child: AvaAutocomplete(
                      controller: _ufController,
                      label: context.l10n.uf,
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
              AvaTextField(
                controller: _unidadeController,
                label: context.l10n.unidade,
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

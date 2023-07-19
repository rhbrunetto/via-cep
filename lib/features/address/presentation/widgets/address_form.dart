import 'package:flutter/material.dart';

import '../../../../l10n/l10n.dart';
import '../../../../ui/colors.dart';
import '../../../../ui/textfield.dart';
import '../../models/address.dart';

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
  final _cepInput = _Input();
  final _logradouroInput = _Input();
  final _complementoInput = _Input();
  final _bairroInput = _Input();
  final _localidadeInput = _Input();
  final _ufInput = _Input();
  final _unidadeInput = _Input();
  final _ibgeInput = _Input();
  final _giaInput = _Input();

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
    _cepInput.controller.text = data.cep;
    _logradouroInput.controller.text = data.logradouro;
    _complementoInput.controller.text = data.complemento;
    _bairroInput.controller.text = data.bairro;
    _localidadeInput.controller.text = data.localidade;
    _ufInput.controller.text = data.uf;
    _unidadeInput.controller.text = data.unidade;
    _ibgeInput.controller.text = data.ibge;
    _giaInput.controller.text = data.gia;

    _cepInput.focusNode.requestFocus();
  }

  void _onSubmit() => widget.onSubmit(
        AddressData(
          cep: _cepInput.controller.text,
          logradouro: _logradouroInput.controller.text,
          complemento: _complementoInput.controller.text,
          bairro: _bairroInput.controller.text,
          localidade: _localidadeInput.controller.text,
          uf: _ufInput.controller.text,
          unidade: _unidadeInput.controller.text,
          ibge: _ibgeInput.controller.text,
          gia: _giaInput.controller.text,
        ),
      );

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          shrinkWrap: true,
          children: [
            AvaTextField(
              controller: _cepInput.controller,
              focusNode: _cepInput.focusNode,
              label: context.l10n.cep,
              // onChanged: widget.onCep,
            ),
            AvaTextField(
              controller: _logradouroInput.controller,
              focusNode: _logradouroInput.focusNode,
              label: context.l10n.logradouro,
            ),
            AvaTextField(
              controller: _complementoInput.controller,
              focusNode: _complementoInput.focusNode,
              label: context.l10n.complemento,
            ),
            AvaTextField(
              controller: _bairroInput.controller,
              focusNode: _bairroInput.focusNode,
              label: context.l10n.bairro,
            ),
            AvaTextField(
              controller: _localidadeInput.controller,
              focusNode: _localidadeInput.focusNode,
              label: context.l10n.localidade,
            ),
            AvaTextField(
              controller: _ufInput.controller,
              focusNode: _ufInput.focusNode,
              label: context.l10n.uf,
            ),
            AvaTextField(
              controller: _unidadeInput.controller,
              focusNode: _unidadeInput.focusNode,
              label: context.l10n.unidade,
            ),
            AvaTextField(
              controller: _ibgeInput.controller,
              focusNode: _ibgeInput.focusNode,
              label: context.l10n.ibge,
            ),
            AvaTextField(
              controller: _giaInput.controller,
              focusNode: _giaInput.focusNode,
              label: context.l10n.gia,
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: _onSubmit,
              child: const Text('Salvar'),
            ),
          ],
        ),
      );
}

class _Input {
  const _Input._(this.controller, this.focusNode);

  factory _Input() => _Input._(TextEditingController(), FocusNode());

  final TextEditingController controller;
  final FocusNode focusNode;
}

import 'package:flutter/material.dart';

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
  final _cepController = TextEditingController();
  final _logradouroController = TextEditingController();
  final _complementoController = TextEditingController();
  final _bairroController = TextEditingController();
  final _localidadeController = TextEditingController();
  final _ufController = TextEditingController();
  final _unidadeController = TextEditingController();
  final _ibgeController = TextEditingController();
  final _giaController = TextEditingController();

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
    _cepController.text = data.cep;
    _logradouroController.text = data.logradouro;
    _complementoController.text = data.complemento;
    _bairroController.text = data.bairro;
    _localidadeController.text = data.localidade;
    _ufController.text = data.uf;
    _unidadeController.text = data.unidade;
    _ibgeController.text = data.ibge;
    _giaController.text = data.gia;
  }

  void _onSubmit() => widget.onSubmit(
        AddressData(
          cep: _cepController.text,
          logradouro: _logradouroController.text,
          complemento: _complementoController.text,
          bairro: _bairroController.text,
          localidade: _localidadeController.text,
          uf: _ufController.text,
          unidade: _unidadeController.text,
          ibge: _ibgeController.text,
          gia: _giaController.text,
        ),
      );

  @override
  Widget build(BuildContext context) => ListView(
        children: [
          TextFormField(
            controller: _cepController,
            onChanged: widget.onCep,
          ),
          TextFormField(
            controller: _logradouroController,
          ),
          TextFormField(
            controller: _complementoController,
          ),
          TextFormField(
            controller: _bairroController,
          ),
          TextFormField(
            controller: _localidadeController,
          ),
          TextFormField(
            controller: _ufController,
          ),
          TextFormField(
            controller: _unidadeController,
          ),
          TextFormField(
            controller: _ibgeController,
          ),
          TextFormField(
            controller: _giaController,
          ),
          ElevatedButton(
            onPressed: _onSubmit,
            child: const Text('Salvar'),
          ),
        ],
      );
}


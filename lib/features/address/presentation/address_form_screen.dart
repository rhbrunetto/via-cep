import 'package:auto_route/auto_route.dart';
import 'package:dfunc/dfunc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/address.dart';
import '../services/address_bloc.dart';

@RoutePage<AddressData>()
class AddressFormScreen extends StatefulWidget {
  const AddressFormScreen({
    super.key,
    this.data,
  });

  final AddressData? data;

  @override
  State<AddressFormScreen> createState() => _State();
}

class _State extends State<AddressFormScreen> {
  late final AddressBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = context.read<AddressBloc>()
      ..add(AddressEvent.initialize(widget.data));
  }

  void _onCepUpdate(String cep) => cep.let(AddressEvent.search).let(_bloc.add);

  void _onSubmit(AddressData data) => context.router.pop(data);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<AddressBloc, AddressState>(
          bloc: _bloc,
          builder: (context, state) => state.map(
            none: always(Container()),
            editing: (state) => _AddressForm(
              data: state.data,
              onCep: _onCepUpdate,
              onSubmit: _onSubmit,
            ),
          ),
        ),
      );
}

class _AddressForm extends StatefulWidget {
  const _AddressForm({
    required this.data,
    required this.onCep,
    required this.onSubmit,
  });

  final AddressData? data;
  final ValueSetter<String> onCep;
  final ValueSetter<AddressData> onSubmit;

  @override
  State<_AddressForm> createState() => __AddressFormState();
}

class __AddressFormState extends State<_AddressForm> {
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
  void didUpdateWidget(covariant _AddressForm oldWidget) {
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

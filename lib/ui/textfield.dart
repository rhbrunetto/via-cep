import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

import 'validators.dart';

class AvaTextField extends StatefulWidget {
  const AvaTextField({
    super.key,
    required this.controller,
    required this.label,
    this.focusNode,
    this.validators,
    this.onFocusMissed,
  });

  final TextEditingController controller;
  final String label;
  final FocusNode? focusNode;
  final List<Validator>? validators;
  final VoidCallback? onFocusMissed;

  @override
  State<AvaTextField> createState() => _AvaTextFieldState();
}

class _AvaTextFieldState extends State<AvaTextField> {
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: TextFormField(
          focusNode: widget.focusNode,
          controller: widget.controller,
          textInputAction: TextInputAction.next,
          validator: (v) => widget.validators?.map((it) => it(v)).firstOrNull,
          onTapOutside: (_) => widget.onFocusMissed?.call(),
          onFieldSubmitted: (_) => widget.onFocusMissed?.call(),
          onEditingComplete: widget.onFocusMissed,
          decoration: InputDecoration(
            labelText: widget.label,
            labelStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
            border: const OutlineInputBorder(),
          ),
        ),
      );
}

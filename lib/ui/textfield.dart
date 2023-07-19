import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:flutter/services.dart';

import 'validators.dart';

class AvaTextField extends StatefulWidget {
  const AvaTextField({
    super.key,
    required this.controller,
    required this.label,
    this.inputType = TextInputType.text,
    this.autoFocus = false,
    this.hint,
    this.inputFormatters,
    this.focusNode,
    this.validators,
    this.onFocusMissed,
  });

  final TextEditingController controller;
  final String label;
  final String? hint;
  final TextInputType inputType;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final List<Validator>? validators;
  final VoidCallback? onFocusMissed;
  final bool autoFocus;

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
          autofocus: true,
          textInputAction: TextInputAction.next,
          validator: (v) => widget.validators?.map((it) => it(v)).firstOrNull,
          onTapOutside: (_) => widget.onFocusMissed?.call(),
          onFieldSubmitted: (_) => widget.onFocusMissed?.call(),
          onEditingComplete: widget.onFocusMissed,
          inputFormatters: widget.inputFormatters,
          keyboardType: widget.inputType,
          decoration: InputDecoration(
            labelText: widget.label,
            labelStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
            hintText: widget.hint,
            hintStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w300,
            ),
            border: const OutlineInputBorder(),
          ),
        ),
      );
}

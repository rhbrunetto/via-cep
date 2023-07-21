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
    this.isPassword = false,
    this.enabled = true,
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
  final bool isPassword;
  final bool enabled;

  @override
  State<AvaTextField> createState() => _AvaTextFieldState();
}

class _AvaTextFieldState extends State<AvaTextField> {
  late bool _obscure;

  @override
  void initState() {
    super.initState();
    _obscure = widget.isPassword;
  }

  void _toggleObscure() => setState(() => _obscure = !_obscure);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: TextFormField(
          focusNode: widget.focusNode,
          controller: widget.controller,
          autofocus: widget.autoFocus,
          obscureText: _obscure,
          enabled: widget.enabled,
          textInputAction: TextInputAction.next,
          validator: (v) =>
              widget.validators?.map((it) => it(v)).whereNotNull().firstOrNull,
          onTapOutside: (_) => widget.onFocusMissed?.call(),
          onFieldSubmitted: (_) => widget.onFocusMissed?.call(),
          onEditingComplete: widget.onFocusMissed,
          inputFormatters: widget.inputFormatters,
          keyboardType: widget.isPassword
              ? TextInputType.visiblePassword
              : widget.inputType,
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
            suffixIcon: widget.isPassword
                ? IconButton(
                    onPressed: _toggleObscure,
                    icon: _obscure
                        ? const Icon(Icons.remove_red_eye)
                        : const Icon(Icons.lock),
                  )
                : null,
          ),
        ),
      );
}

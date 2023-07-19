import 'package:flutter/material.dart';

class AvaTextField extends StatefulWidget {
  const AvaTextField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.label,
    this.onValidate,
    this.nextFocus,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final String label;
  final String? Function(String)? onValidate;
  final FocusNode? nextFocus;

  @override
  State<AvaTextField> createState() => _AvaTextFieldState();
}

class _AvaTextFieldState extends State<AvaTextField> {
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: TextFormField(
          controller: widget.controller,
          focusNode: widget.focusNode,
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

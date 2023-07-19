import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import '../l10n/l10n.dart';
import 'textfield.dart';
import 'validators.dart';

typedef SuggestionBuilder = Iterable<String> Function(String);

class AvaAutocomplete extends StatefulWidget {
  const AvaAutocomplete({
    super.key,
    required this.controller,
    required this.label,
    required this.suggestionBuilder,
    required this.enforceOption,
  });

  final TextEditingController controller;
  final String label;
  final SuggestionBuilder suggestionBuilder;
  final Iterable<String> enforceOption;

  @override
  State<AvaAutocomplete> createState() => _AvaAutocompleteState();
}

class _AvaAutocompleteState extends State<AvaAutocomplete> {
  @override
  Widget build(BuildContext context) => Autocomplete<String>(
        onSelected: (it) => widget.controller.text = it,
        optionsBuilder: (it) => widget.suggestionBuilder(it.text),
        fieldViewBuilder: (context, controller, focusNode, __) => AvaTextField(
          controller: controller,
          focusNode: focusNode,
          label: widget.label,
          onFocusMissed: () => widget.controller.text = controller.text,
          validators: widget.enforceOption.isNotEmpty
              ? [
                  context.requiredValidator(),
                  (_) {
                    final input = widget.controller.text.toLowerCase();
                    final option = widget.enforceOption.firstWhereOrNull(
                      (e) => e.toLowerCase() == input,
                    );
                    if (option != null) return null;
                    return context.l10n.validatorInvalid;
                  }
                ]
              : null,
        ),
      );
}

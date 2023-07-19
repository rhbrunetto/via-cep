import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import '../l10n/l10n.dart';
import 'textfield.dart';
import 'validators.dart';

typedef SuggestionBuilder = Iterable<String> Function(String);

class AvaAutocomplete extends StatelessWidget {
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
  Widget build(BuildContext context) => ValueListenableBuilder(
        valueListenable: controller,
        builder: (context, value, _) => Autocomplete<String>(
          initialValue: value,
          onSelected: (it) => controller.text = it,
          optionsBuilder: (it) => suggestionBuilder(it.text),
          fieldViewBuilder: (
            context,
            aController,
            focusNode,
            _,
          ) =>
              _InternalField(
            controller: controller,
            autocompleteController: aController,
            focusNode: focusNode,
            label: label,
            suggestionBuilder: suggestionBuilder,
            enforceOption: enforceOption,
          ),
        ),
      );
}

class _InternalField extends StatefulWidget {
  const _InternalField({
    required this.controller,
    required this.autocompleteController,
    required this.focusNode,
    required this.label,
    required this.suggestionBuilder,
    required this.enforceOption,
  });

  final TextEditingController controller;
  final TextEditingController autocompleteController;
  final FocusNode focusNode;
  final String label;
  final SuggestionBuilder suggestionBuilder;
  final Iterable<String> enforceOption;

  @override
  State<_InternalField> createState() => __InternalFieldState();
}

class __InternalFieldState extends State<_InternalField> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_updateAutoComplete);
  }

  @override
  void dispose() {
    super.dispose();
    widget.controller.removeListener(_updateAutoComplete);
  }

  void _updateAutoComplete() {
    if (widget.autocompleteController.text == widget.controller.text) return;
    widget.autocompleteController.text = widget.controller.text;
  }

  @override
  Widget build(BuildContext context) {
    return AvaTextField(
      controller: widget.autocompleteController,
      focusNode: widget.focusNode,
      label: widget.label,
      onFocusMissed: () =>
          widget.controller.text = widget.autocompleteController.text,
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
    );
  }
}

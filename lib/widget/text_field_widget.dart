import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String? label;
  final String? hintText;
  final String? errorText;
  final int? maxLines;
  final TextInputType? keyboardType;
  final InputBorder? inputBorder;
  final bool filled;
  final bool enableInteractiveSelection;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final TextEditingController? controller;
  final void Function(String)? onChanged;

  const TextFieldWidget(
      {super.key,
      this.label,
      this.hintText,
      this.errorText,
      this.onChanged,
      this.controller,
      this.maxLines,
      this.floatingLabelBehavior = FloatingLabelBehavior.always,
      this.keyboardType,
      this.filled = true,
      this.enableInteractiveSelection = true,
      this.inputBorder});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          floatingLabelBehavior: floatingLabelBehavior,
          label: Text(label ?? ''),
          hintText: hintText,
          filled: filled,
          border: inputBorder,
          errorText: errorText),
      enableInteractiveSelection: enableInteractiveSelection,
      maxLines: maxLines,
      keyboardType: keyboardType,
      controller: controller,
      onChanged: onChanged,
      // keyboardType: TextInputType.text,
    );
  }
}

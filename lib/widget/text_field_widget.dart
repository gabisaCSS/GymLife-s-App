import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String label;
  final String hintText;
  final String? errorText;
  final int? maxLines;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final void Function(String)? onChanged;

  const TextFieldWidget(
      {super.key,
      required this.label,
      required this.hintText,
      this.errorText,
      this.onChanged,
      this.controller,
      this.maxLines,
      this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          label: Text(label),
          hintText: hintText,
          filled: true,
          errorText: errorText),
      maxLines: maxLines,
      keyboardType: keyboardType,
      controller: controller,
      onChanged: onChanged,
      // keyboardType: TextInputType.text,
    );
  }
}

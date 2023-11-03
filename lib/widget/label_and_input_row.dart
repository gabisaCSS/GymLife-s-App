import 'package:flutter/material.dart';
import 'package:gym_lifes_app/widget/text_field_widget.dart';

class LabelAndInputRow extends StatelessWidget {
  final String label;
  final String? errorText;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final InputBorder? inputBorder;

  const LabelAndInputRow({
    super.key,
    required this.label,
    this.errorText,
    this.controller,
    this.onChanged,
    this.inputBorder,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16),
        ),
        Container(
          padding: const EdgeInsets.only(left: 16),
          width: 60,
          height: 40,
          child: TextFieldWidget(
            filled: false,
            maxLines: 1,
            controller: controller,
            errorText: errorText,
            enableInteractiveSelection: false,
            keyboardType: TextInputType.number,
            inputBorder: inputBorder,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}

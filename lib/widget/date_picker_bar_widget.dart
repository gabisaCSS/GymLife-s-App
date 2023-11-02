import 'dart:async';
import 'package:flutter/material.dart';

class DatePickerBarWidget extends StatelessWidget {
  final void Function()? onPressedLeftArrow;
  final void Function()? onPressedRightArrow;
  final void Function()? onPressedDateTextButton;
  final FutureOr<dynamic> Function(DateTime?) onChangedDate;
  final String dateText;
  final DateTime? initialDate;
  const DatePickerBarWidget(
      {super.key,
      this.onPressedLeftArrow,
      this.onPressedRightArrow,
      this.onPressedDateTextButton,
      required this.dateText,
      this.initialDate,
      required this.onChangedDate});

  @override
  Widget build(BuildContext context) {
    return Container(
        // padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(bottom: BorderSide(width: 1, color: Colors.grey))),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          IconButton(
              icon: const Icon(Icons.keyboard_arrow_left_outlined),
              onPressed: onPressedLeftArrow),
          TextButton(
            onPressed: () {
              showDatePicker(
                      context: context,
                      initialDate: initialDate,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2025))
                  .then(onChangedDate);
            },
            child: Text(
              dateText,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.keyboard_arrow_right_outlined),
            onPressed: onPressedRightArrow,
          ),
        ]));
  }
}

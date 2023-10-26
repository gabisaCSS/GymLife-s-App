import 'package:flutter/material.dart';

class DatePickerBarComponent extends StatelessWidget {
  const DatePickerBarComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(width: 1, color: Colors.grey))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.keyboard_arrow_left_outlined),
            onPressed: () {},
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              'Today',
              style: TextStyle(fontSize: 16),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.keyboard_arrow_right_outlined),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

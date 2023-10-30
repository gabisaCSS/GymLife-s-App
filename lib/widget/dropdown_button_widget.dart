import 'package:flutter/material.dart';

class DropdownButtonWidget extends StatelessWidget {
  final String value;
  final List<String> itemsList;
  final Color? dropdownColor;
  final void Function(String?)? onChanged;
  const DropdownButtonWidget({
    super.key,
    required this.value,
    required this.itemsList,
    this.dropdownColor,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 110,
      child: DropdownButton(
          dropdownColor: dropdownColor,
          isExpanded: true,
          underline: const SizedBox(),
          value: value,
          items: itemsList
              .map((String item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                          fontSize: 11, fontWeight: FontWeight.normal),
                    ),
                  ))
              .toList(),
          onChanged: onChanged),
    );
  }
}

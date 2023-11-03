import 'package:flutter/material.dart';

class BoxDecorationStyle {
  static BoxDecoration basicBox = BoxDecoration(
    color: Colors.white,
    borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
        bottomLeft: Radius.circular(10),
        bottomRight: Radius.circular(10)),
    // border: Border.all(),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 2,
        blurRadius: 2,
        offset: const Offset(0, 2),
      ),
    ],
  );
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyleWidget {
  // display
  static TextStyle m3DisplayLarge({Color? color}) {
    return GoogleFonts.roboto(
        fontSize: 57,
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black);
  }

  static TextStyle m3DisplayMedium({Color? color}) {
    return GoogleFonts.roboto(
        fontSize: 45,
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black);
  }

  static TextStyle m3DisplaySmall({Color? color}) {
    return GoogleFonts.roboto(fontSize: 36, fontWeight: FontWeight.w400);
  }

  // headline
  static TextStyle m3HeadlineLarge({Color? color}) {
    return GoogleFonts.roboto(
        fontSize: 32,
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black);
  }

  static TextStyle m3HeadlineMedium({Color? color}) {
    return GoogleFonts.roboto(
        fontSize: 28,
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black);
  }

  static TextStyle m3HeadlineSmall({Color? color}) {
    return GoogleFonts.roboto(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black);
  }

  // title
  static TextStyle m3TitleLarge({Color? color}) {
    return GoogleFonts.roboto(
        fontSize: 22,
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black);
  }

  static TextStyle m3TitleMedium({Color? color}) {
    return GoogleFonts.roboto(
      fontSize: 19,
      fontWeight: FontWeight.w500,
      color: color ?? Colors.black,
    );
  }

  static TextStyle m3TitleSmall({Color? color}) {
    return GoogleFonts.roboto(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: color ?? Colors.black,
    );
  }

  // label
  static TextStyle m3LabelLarge({Color? color}) {
    return GoogleFonts.roboto(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: color ?? Colors.black,
    );
  }

  static TextStyle m3LabelMedium({Color? color}) {
    return GoogleFonts.roboto(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: color ?? Colors.black,
    );
  }

  static TextStyle m3LabelSmall({Color? color, bool isBold = false}) {
    return GoogleFonts.roboto(
      fontSize: 11,
      fontWeight: isBold ? FontWeight.w500 : FontWeight.normal,
      color: color ?? Colors.black,
    );
  }

  // body
  static TextStyle m3BodyLarge({Color? color, bool isBold = false}) {
    return GoogleFonts.roboto(
      fontSize: 16,
      fontWeight: isBold ? FontWeight.w700 : FontWeight.w400,
      color: color ?? Colors.black,
    );
  }

  static TextStyle m3BodyPas({Color? color, bool isBold = false}) {
    return GoogleFonts.roboto(
      fontSize: 18,
      fontWeight: isBold ? FontWeight.w600 : FontWeight.w400,
      color: color ?? Colors.black,
    );
  }

  static TextStyle m3BodyMedium({Color? color}) {
    return GoogleFonts.roboto(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: color ?? Colors.black,
    );
  }

  static TextStyle m3BodySmall({Color? color}) {
    return GoogleFonts.roboto(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: color ?? Colors.black,
    );
  }

  static TextStyle m3Header1({Color? color}) {
    return GoogleFonts.roboto(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: color ?? Colors.black,
    );
  }

  static TextStyle m3Header2({Color? color}) {
    return GoogleFonts.roboto(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: color ?? Colors.black,
    );
  }

  static TextStyle m3Title({Color? color}) {
    return GoogleFonts.roboto(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: color ?? Colors.black,
    );
  }

  static TextStyle smallLabel(
      {Color? color, bool isBold = false, bool isMild = false}) {
    return GoogleFonts.roboto(
      fontSize: 12,
      fontWeight: isBold
          ? FontWeight.bold
          : isMild
              ? FontWeight.w600
              : FontWeight.w400,
      color: color ?? Colors.black,
    );
  }

  static TextStyle mediumLabel(
      {Color? color, bool isBold = false, bool isMild = false}) {
    return GoogleFonts.roboto(
      fontSize: 15,
      fontWeight: isBold
          ? FontWeight.bold
          : isMild
              ? FontWeight.w600
              : FontWeight.w400,
      color: color ?? Colors.black,
    );
  }
}

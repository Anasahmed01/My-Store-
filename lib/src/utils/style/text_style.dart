import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  static customTextStyle({
    double? size,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return GoogleFonts.poppins(
      fontSize: size ?? 14,
      fontWeight: fontWeight ?? FontWeight.normal,
      color: color ?? Colors.black,
    );
  }
}

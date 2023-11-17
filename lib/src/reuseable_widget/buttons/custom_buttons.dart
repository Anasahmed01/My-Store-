import 'package:flutter/material.dart';
import '../text/custome_text.dart';

Widget customButton({
  required String text,
  required double buttonHeight,
  required double buttonwidth,
  Color? buttonColor,
  int? maxLine,
  Color? textColor,
  FontWeight? fontWeight,
  TextOverflow? overflow,
  TextAlign? textAlign,
  double? textSize,
  double? borderRadius,
}) {
  return Container(
    height: buttonHeight,
    width: buttonwidth,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(borderRadius ?? 30),
      color: buttonColor ?? Colors.red,
    ),
    child: Center(
      child: customSizedText(
        overflow: overflow ?? TextOverflow.ellipsis,
        color: textColor ?? Colors.white,
        fontWeight: fontWeight ?? FontWeight.normal,
        maxLine: maxLine ?? 1,
        size: textSize ?? 14,
        textAlign: textAlign ?? TextAlign.center,
        text: text,
      ),
    ),
  );
}

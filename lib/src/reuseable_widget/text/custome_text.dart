import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../utils/style/text_style.dart';

Widget customSizedText({
  required String text,
  Color? color,
  int? maxLine,
  TextOverflow? overflow,
  TextAlign? textAlign,
  double? size,
  FontWeight? fontWeight,
  double? minFontSize,
  double? maxFontSize,
}) {
  return AutoSizeText(
    text,
    maxLines: maxLine ?? 1,
    overflow: overflow ?? TextOverflow.ellipsis,
    textAlign: textAlign ?? TextAlign.justify,
    textDirection: TextDirection.ltr,
    minFontSize: minFontSize ?? 8,
    maxFontSize: maxFontSize ?? 34,
    style: AppTextStyle.customTextStyle(
      size: size ?? 14,
      fontWeight: fontWeight ?? FontWeight.normal,
      color: color ?? Colors.black,
    ),
  );
}

import 'package:flutter/material.dart';

Widget appTextField({
  controller,
  onPressed,
  //prefixIcon,
  double? height,
  Color? borderColor,
  width,
  hintText,
  validator,
  initialValue,
  obscureText = false,
  IconData? suffixIcon,
  onSuffixPressed,
  readOnly = false,
  onChanged,
  keBoardType,
}) {
  //final bool suffixTapped;
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      border: Border.all(
        color: borderColor ?? Colors.transparent,
      ),
    ),
    child: TextFormField(
      cursorColor: Colors.black,
      textInputAction: TextInputAction.next,
      textAlign: TextAlign.start,
      keyboardType: keBoardType,
      readOnly: readOnly,
      onTap: onPressed,
      initialValue: initialValue,
      controller: controller,
      onChanged: onChanged,
      validator: validator,
      obscureText: obscureText!,
      decoration: InputDecoration(
        errorStyle: const TextStyle(color: Colors.red),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(color: Colors.red),
        ),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(color: Colors.red)),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20.0),
        hintText: hintText,
        labelStyle: const TextStyle(fontSize: 10.0),
        // prefixIcon: Padding(
        //   padding: const EdgeInsets.only(left: 35.0, bottom: 2, right: 10),
        //   child: Icon(
        //     prefixIcon,
        //     size: 18.0,
        //     color: Colors.grey,
        //   ),
        // ),
        suffixIcon: GestureDetector(
          onTap: onSuffixPressed,
          child: Icon(suffixIcon, color: Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade400,
          ),
          borderRadius: BorderRadius.circular(30.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(30.0),
        ),
        filled: true,
        alignLabelWithHint: true,
        fillColor: Colors.grey[100],
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
      ),
    ),
  );
}

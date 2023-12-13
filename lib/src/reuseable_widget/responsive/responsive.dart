// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobileBody;
  final Widget desktopBody;
  const Responsive({
    Key? key,
    required this.mobileBody,
    required this.desktopBody,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 600) {
        return mobileBody;
      } else {
        return desktopBody;
      }
    });
  }
}

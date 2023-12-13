// ignore_for_file: prefer_const_constructors

import 'package:checkout/src/reuseable_widget/responsive/desktop_body.dart';
import 'package:checkout/src/reuseable_widget/responsive/mobile_body.dart';
import 'package:checkout/src/reuseable_widget/responsive/responsive.dart';
import 'package:checkout/src/views/home/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onViewModelReady: (viewModel) async {},
      builder: (context, viewModel, child) {
        return Responsive(mobileBody: MobileBody(), desktopBody: DesktopBody());
      },
    );
  }
}

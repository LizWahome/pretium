import 'package:flutter/material.dart';
import 'package:pretium_app/utils/assets.dart';
import 'package:pretium_app/utils/onboarding_pages.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return ColumnWidget(
      imagePath: AssetsUrls.page1,
      title: "Direct Pay",
      description: "Pay with crypto across Africa effortlessly",
    );
  }
}
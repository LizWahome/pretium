import 'package:flutter/material.dart';
import 'package:pretium_app/utils/assets.dart';
import 'package:pretium_app/utils/onboarding_pages.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return ColumnWidget(imagePath: AssetsUrls.page3, title: "Pay Bills", description: "Pay for utility and earn rewards");
  }
}
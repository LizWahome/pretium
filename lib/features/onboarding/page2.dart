import 'package:flutter/material.dart';
import 'package:pretium_app/utils/assets.dart';
import 'package:pretium_app/utils/onboarding_pages.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return ColumnWidget(
      imagePath: AssetsUrls.page2,
      title: "Accept Payments",
      description: "Accept stablecoin payments hassle-free",
    );
  }
}
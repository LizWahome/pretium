import 'package:flutter/material.dart';
import 'package:pretium_app/features/authentication/login.dart';
import 'package:pretium_app/features/onboarding/page1.dart';
import 'package:pretium_app/features/onboarding/page2.dart';
import 'package:pretium_app/features/onboarding/page3.dart';
import 'package:pretium_app/utils/button.dart';
import 'package:pretium_app/utils/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: TextButton(
                  onPressed: () {
                    _pageController.jumpToPage(2);
                  },
                  child: const Text(
                    "Skip",
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(bottom: 80),
                child: PageView(
                  controller: _pageController,
                  children: [Page1(), Page2(), Page3()],
                ),
              ),
            ),
          ],
        ),
        bottomSheet: Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          height: 100,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Center(
                  child: SmoothPageIndicator(
                    controller: _pageController,
                    count: 3,
                    effect: const WormEffect(
                      activeDotColor: AppColors.primaryColor,
                      dotHeight: 10,
                      dotWidth: 10,
                      spacing: 16,
                    ),
                    onDotClicked: (index) {
                      _pageController.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    },
                  ),
                ),
              ),
              CustomButton(
                title: (_pageController.hasClients && _pageController.page == 2) ? "Get Started" : "Next",
                onPressed: () {
                  if (_pageController.page == 2) {
                    // Navigate to the next screen
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const LoginScreen();
                    }));
                  } else {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  }
                },
              ),
             
            ],
          ),
        ));
  }
}

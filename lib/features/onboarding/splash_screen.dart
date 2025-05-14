import 'package:flutter/material.dart';
import 'package:pretium_app/features/onboarding/onboarding.dart';
import 'package:pretium_app/utils/assets.dart';
import 'package:pretium_app/utils/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      if(mounted){
        Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const OnboardingPage();
      }));
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(child: 
      Image.asset(AssetsUrls.slash),),
    );
  }
}
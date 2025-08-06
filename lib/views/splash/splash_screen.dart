import 'package:flutter/material.dart';
import 'package:fitquest/core/constants/app_assets.dart';
import 'package:fitquest/core/constants/app_colors.dart';
import 'package:fitquest/views/auth/auth_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const AuthScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Image.asset(
          AppAssets.logo,
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:fitquest/core/constants/app_colors.dart';
import 'package:fitquest/views/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FitQuest',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primaryGreen,
        scaffoldBackgroundColor: AppColors.white,

        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: AppColors.black),
        ),

        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.white,
          labelStyle: const TextStyle(color: AppColors.gray),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.borderColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.borderColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.primaryGreen, width: 2),
          ),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}

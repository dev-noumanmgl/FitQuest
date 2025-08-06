import 'package:fitquest/core/widgets/custom_button.dart';
import 'package:fitquest/views/auth/display_name_screen.dart';
import 'package:fitquest/views/auth/signup_screen.dart';
import 'package:fitquest/views/auth/widgets/auth_buttons.dart';
import 'package:fitquest/views/dashboard/main_view.dart';
import 'package:flutter/material.dart';
import 'package:fitquest/core/constants/app_colors.dart';
import 'package:fitquest/core/constants/app_strings.dart';
import 'package:fitquest/core/constants/app_assets.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const Spacer(flex: 3),

              // Title
              const Text(
                AppStrings.welcome,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 8),

              // Subtitle
              const Text(
                AppStrings.loginPrompt,
                style: TextStyle(fontSize: 16, color: AppColors.gray),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 40),

              // Google Button with image
              LoginButtonImage(
                imagePath: AppAssets.googleLogo,
                text: AppStrings.continueGoogle,
                onTap: () {},
              ),

              const SizedBox(height: 16),

              // Apple Button with image
              LoginButtonImage(
                imagePath: AppAssets.appleLogo,
                text: AppStrings.continueApple,
                onTap: () {},
              ),

              const SizedBox(height: 24),

              // Divider with 'or'
              Row(
                children: [
                  Expanded(child: Divider(color: Colors.grey[300])),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text("or", style: TextStyle(color: Colors.grey)),
                  ),
                  Expanded(child: Divider(color: Colors.grey[300])),
                ],
              ),

              const SizedBox(height: 24),

              // Sign Up with Email button (no icon)
              CustomButton(
                text: AppStrings.signupEmail,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const SignupWithEmailScreen()),
                  );
                },
              ),
              const SizedBox(height: 16),

              // Log in link
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const DisplayNameScreen(),
                    ),
                  );
                },
                child: const Text(
                  AppStrings.login,
                  style: TextStyle(
                    color: AppColors.primaryGreen,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),

              const Spacer(flex: 4),
            ],
          ),
        ),
      ),
    );
  }
}

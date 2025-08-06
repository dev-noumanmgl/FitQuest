import 'package:fitquest/core/widgets/custom_button.dart';
import 'package:fitquest/views/auth/display_name_screen.dart';
import 'package:flutter/material.dart';
import 'package:fitquest/core/constants/app_colors.dart';
import 'package:fitquest/core/widgets/custom_textfield.dart';

class SignupWithEmailScreen extends StatefulWidget {
  const SignupWithEmailScreen({super.key});

  @override
  State<SignupWithEmailScreen> createState() => _SignupWithEmailScreenState();
}

class _SignupWithEmailScreenState extends State<SignupWithEmailScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.background,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new, size: 18),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Email
              CustomTextField(
                label: 'Email',
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),

              // Password
              CustomTextField(
                label: 'Password',
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: obscurePassword,
                hasSuffixIcon: true,
                onToggleObscure: () {
                  setState(() => obscurePassword = !obscurePassword);
                },
              ),
              const SizedBox(height: 16),

              // Confirm Password
              CustomTextField(
                label: 'Confirm Password',
                controller: confirmPasswordController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: obscureConfirmPassword,
                hasSuffixIcon: true,
                onToggleObscure: () {
                  setState(() => obscureConfirmPassword = !obscureConfirmPassword);
                },
              ),
              const SizedBox(height: 24),

              // Sign Up Button
              CustomButton(
                text: 'Sign Up',
                onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const DisplayNameScreen()),
                    );
                },
              ),
              const SizedBox(height: 16),

              // Already have account
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account?'),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      'Login',
                      style: TextStyle(color: AppColors.primaryGreen),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

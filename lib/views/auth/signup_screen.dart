import 'package:fitquest/view_models/auth_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:fitquest/core/constants/app_colors.dart';
import 'package:fitquest/core/widgets/custom_button.dart';
import 'package:fitquest/core/widgets/custom_textfield.dart';
import 'display_name_screen.dart';

class SignupWithEmailScreen extends StatefulWidget {
  const SignupWithEmailScreen({super.key});

  @override
  State<SignupWithEmailScreen> createState() => _SignupWithEmailScreenState();
}

class _SignupWithEmailScreenState extends State<SignupWithEmailScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: SingleChildScrollView(
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

                CustomTextField(
                  label: 'Username',
                  controller: usernameController,
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 16),

                CustomTextField(
                  label: 'Email',
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16),

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

                CustomButton(
                  text: 'Sign Up',
                  onPressed: () {
                    final email = emailController.text.trim();
                    final username = usernameController.text.trim();
                    final password = passwordController.text.trim();
                    final confirmPassword = confirmPasswordController.text.trim();

                    if (email.isEmpty || username.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
                      EasyLoading.showError('All fields are required');
                      return;
                    }
                    if (password != confirmPassword) {
                      EasyLoading.showError('Passwords do not match');
                      return;
                    }

                    authViewModel.signUp(
                      email: email,
                      password: password,
                      username: username,
                      onSuccess: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => DisplayNameScreen(username: username)),
                        );
                      },
                    );
                  },
                ),
                const SizedBox(height: 16),

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
      ),
    );
  }
}

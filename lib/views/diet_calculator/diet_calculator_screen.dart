import 'package:fitquest/views/diet_calculator/widgets/custom_dropdown.dart';
import 'package:fitquest/views/diet_calculator/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:fitquest/core/constants/app_colors.dart';

class DietCalculatorScreen extends StatefulWidget {
  const DietCalculatorScreen({super.key});

  @override
  State<DietCalculatorScreen> createState() => _DietCalculatorScreenState();
}

class _DietCalculatorScreenState extends State<DietCalculatorScreen> {
  String? selectedSex;
  String? selectedActivity;
  final TextEditingController ageController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();

  final List<String> sexes = ['Male', 'Female'];
  final List<String> activityLevels = [
    'Sedentary',
    'Lightly Active',
    'Moderately Active',
    'Very Active',
    'Super Active',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Page Title (like Profile)
              const Text(
                'Diet Calculator',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 32),

              // Sex Dropdown
              CustomDropdown(
                label: 'Sex',
                value: selectedSex,
                items: sexes,
                onChanged: (value) {
                  setState(() => selectedSex = value);
                },
              ),
              const SizedBox(height: 16),

              // Age Input
              CustomTextField(
                label: 'Age',
                controller: ageController,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),

              // Weight Input
              CustomTextField(
                label: 'Weight (kg)',
                controller: weightController,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),

              // Height Input
              CustomTextField(
                label: 'Height (cm)',
                controller: heightController,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),

              // Activity Level Dropdown
              CustomDropdown(
                label: 'Activity Level',
                value: selectedActivity,
                items: activityLevels,
                onChanged: (value) {
                  setState(() => selectedActivity = value);
                },
              ),
              const SizedBox(height: 32),

              SizedBox(
                height: 54,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryGreen,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Calculate',
                    style: TextStyle(fontSize: 16, color: AppColors.white),
                  ),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}

import 'package:fitquest/views/store/store_screen.dart';
import 'package:fitquest/views/dashboard/widgets/bottom_nav_bar.dart';
import 'package:fitquest/views/home/home_screen.dart';
import 'package:fitquest/views/premium/premium_screen.dart';
import 'package:fitquest/views/diet_calculator/diet_calculator_screen.dart';
import 'package:fitquest/views/profile/profile_screen.dart';
import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const StoreScreen(),
    UpgradeScreen(),
    DietCalculatorScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
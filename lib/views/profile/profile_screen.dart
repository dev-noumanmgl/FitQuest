import 'package:fitquest/views/profile/widgets/coin_tile.dart';
import 'package:fitquest/views/profile/widgets/profile_setting_tile.dart';
import 'package:fitquest/views/settings/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:fitquest/core/constants/app_colors.dart';
import 'package:fitquest/core/constants/app_strings.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Profile',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const SettingsScreen(),
                        ),
                      );
                    },
                    icon: Icon(Icons.settings, size: 28, color: AppColors.primaryGreen),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Top Row: Profile avatar + status + Upgrade
              Row(
                children: [
                  const CircleAvatar(
                    radius: 24,
                    backgroundColor: AppColors.primaryGreen,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'Basic',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      'Upgrade',
                      style: TextStyle(
                        color: AppColors.primaryGreen,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Referral Section
              ProfileSettingTile(
                title: 'Referrals',
                subtitle: 'Invite your friends',
                onTap: () {},
              ),
              const SizedBox(height: 16),

              // Coins Section (simplified to match design exactly)
              const CoinTile(
                coinAmount: '56 Gays', // Adjust if needed
                rightLabel: 'Coin Hustle',
              ),

              const SizedBox(height: 16),

              // Tiers Section
              ProfileSettingTile(
                title: 'Tiers',
                subtitle: 'View benefits',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

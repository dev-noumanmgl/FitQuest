import 'package:fitquest/core/data/model_data/setting_item_list.dart';
import 'package:flutter/material.dart';
import 'package:fitquest/core/constants/app_colors.dart';
import 'package:fitquest/views/settings/widgets/setting_tile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

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
              // iOS-style Back & Title
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
                    'Settings',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Settings List from Model
              Expanded(
                child: ListView.separated(
                  itemCount: settingItems.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    final item = settingItems[index];
                    return SettingTile(
                      icon: item.icon,
                      title: item.title,
                      subtitle: item.subtitle,
                      onTap: item.onTap,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

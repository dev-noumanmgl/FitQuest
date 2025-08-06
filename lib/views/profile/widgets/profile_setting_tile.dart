import 'package:flutter/material.dart';
import 'package:fitquest/core/constants/app_colors.dart';

class ProfileSettingTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const ProfileSettingTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.borderColor),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 16)),
                  const SizedBox(height: 2),
                  Text(subtitle,
                      style: const TextStyle(
                          fontSize: 14, color: AppColors.gray)),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: AppColors.gray),
          ],
        ),
      ),
    );
  }
}

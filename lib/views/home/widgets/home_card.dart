import 'package:flutter/material.dart';
import 'package:fitquest/core/constants/app_colors.dart';

class HomeCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? image;
  final bool filled;

  const HomeCard({
    super.key,
    required this.title,
    this.subtitle,
    this.image,
    this.filled = false,
  });

  @override
  Widget build(BuildContext context) {
    final bool hasImage = image != null;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: filled
            ? AppColors.primaryGreen
            : AppColors.cardColor, // Green for Store
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          if (hasImage) ...[
            Image.asset(image!, height: 85, fit: BoxFit.cover,),
            const SizedBox(height: 8),
          ],
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: filled ? Colors.white : AppColors.black,
                ),
              ),
              if (subtitle != null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.monetization_on,
                        size: 16,
                        color: filled ? Colors.white : AppColors.primaryGreen),
                    const SizedBox(width: 4),
                    Text(
                      subtitle!,
                      style: TextStyle(
                        color: filled ? Colors.white : Colors.black,
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }
}

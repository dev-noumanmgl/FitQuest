import 'package:flutter/material.dart';
import 'package:fitquest/core/constants/app_colors.dart';

class StoreCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String coin;

  const StoreCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.coin,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: 180, // Set minimum height for all cards
      ),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.cardColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Distribute space
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 100,
                  child: Center(
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold, 
                    fontSize: 16
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            // This empty SizedBox will take up space when coin is empty
            if (coin.isEmpty) 
              const SizedBox(height: 24), // Matches coin row height
            if (coin.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Row(
                  children: [
                    const Icon(
                      Icons.monetization_on,
                      size: 16, 
                      color: AppColors.primaryGreen,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      coin, 
                      style: const TextStyle(fontSize: 14)
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
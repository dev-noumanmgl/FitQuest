import 'package:flutter/material.dart';
import 'package:fitquest/core/constants/app_colors.dart';

class CoinTile extends StatelessWidget {
  final String coinAmount;
  final String rightLabel;

  const CoinTile({
    super.key,
    required this.coinAmount,
    required this.rightLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
              children: const [
                Text(
                  'Coins',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 4),
                Text(
                  'Coin History',
                  style: TextStyle(fontSize: 14, color: AppColors.gray),
                ),
              ],
            ),
          ),

          // Right Section
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                coinAmount,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 4),
              Text(
                rightLabel,
                style: const TextStyle(fontSize: 14, color: AppColors.gray),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

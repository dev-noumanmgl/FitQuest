import 'package:fitquest/core/data/model_data/store_item_list.dart';
import 'package:flutter/material.dart';
import 'package:fitquest/core/constants/app_assets.dart';
import 'package:fitquest/core/constants/app_colors.dart';
import 'package:fitquest/views/store/widgets/store_card.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = (screenWidth - 52) / 2; // Account for padding and spacing

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Store',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.add, size: 28),
                ],
              ),
              const SizedBox(height: 20),
        
              // iPhone Image + Info
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  color: AppColors.cardColor,
                  width: double.infinity,
                  child: Image.asset(
                    AppAssets.iphone,
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'iPhone 16 Pro Max',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 4),
              Row(
                children: const [
                  Icon(
                    Icons.monetization_on,
                    color: AppColors.primaryGreen,
                    size: 16,
                  ),
                  SizedBox(width: 4),
                  Text('5,500'),
                ],
              ),
              const SizedBox(height: 20),
        
              // Category Tabs (scrollable)
              SizedBox(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CategoryChip(label: 'Categories', isActive: true),
                    CategoryChip(label: 'Tech'),
                    const SizedBox(width: 10),
                    CategoryChip(label: 'Fitness'),
                    const SizedBox(width: 10),
                    CategoryChip(label: 'Wellness'),
                  ],
                ),
              ),
              const SizedBox(height: 20),
        
              GridView.builder(
                itemCount: storeItems.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 12,
                  childAspectRatio: 3 / 3.2,
                ),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final item = storeItems[index];
                  return StoreCard(
                    imagePath: item.imagePath,
                    title: item.title,
                    coin: item.coin,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryChip extends StatelessWidget {
  final String label;
  final bool isActive;
  const CategoryChip({super.key, required this.label, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 18,
          color: isActive ? Colors.black : Colors.black26,
          fontWeight: isActive ? FontWeight.bold : FontWeight.w400,
        ),
      ),
    );
  }
}

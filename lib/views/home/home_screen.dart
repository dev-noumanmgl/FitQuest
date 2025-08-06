import 'package:fitquest/core/data/model_data/home_item_list.dart';
import 'package:flutter/material.dart';
import 'package:fitquest/core/constants/app_colors.dart';
import 'package:fitquest/views/home/widgets/home_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Greeting
              const Text(
                'Hi, Adam',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              // Step Summary Box
              Container(
                padding: const EdgeInsets.all(20),
                height: 120,
                decoration: BoxDecoration(
                  color: AppColors.cardColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    // Left Side
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'STEPS',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '7,980',
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Right Side (Circular Indicator)
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 75,
                          height: 75,
                          child: CircularProgressIndicator(
                            value: 0.8,
                            strokeWidth: 6,
                            color: AppColors.primaryGreen,
                            backgroundColor: Colors.grey.shade300,
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Text(
                              '2,500',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              'nonter go',
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Big Buttons
              Row(
                children: const [
                  Expanded(
                    child: HomeCard(title: 'Store', filled: true),
                  ), // Green background
                  SizedBox(width: 10),
                  Expanded(child: HomeCard(title: 'Daily Goals')),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: const [
                  Expanded(child: HomeCard(title: 'Daily Goals')),
                  SizedBox(width: 10),
                  Expanded(child: HomeCard(title: 'Diet Tracker')),
                ],
              ),
              const SizedBox(height: 20),

              // Featured Products (Smartwatches)
              const Text(
                ' ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 10),

              GridView.builder(
                itemCount: homeCardList.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 3 / 3.6,
                ),
                itemBuilder: (context, index) {
                  final item = homeCardList[index];
                  return HomeCard(
                    image: item.image,
                    title: item.title,
                    subtitle: item.subtitle,
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

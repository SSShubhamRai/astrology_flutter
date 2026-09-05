import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart'; // Centralized AppColors import kiya gaya hai

class PujaProcessSection extends StatelessWidget {
  const PujaProcessSection({super.key});

  final List<Map<String, String>> _steps = const [
    {
      'step': '1',
      'title': 'Select your Puja',
      'description': 'Choose the Puja that fits your need.',
    },
    {
      'step': '2',
      'title': 'Select your Puja package',
      'description': 'Choose the puja package that best matches your intention and purpose.',
    },
    {
      'step': '3',
      'title': 'Enter your sankalp details',
      'description': 'Add devotee Name & Gotra for the puja. Verified pandit will these at the temple.',
    },
    {
      'step': '4',
      'title': 'Complete secure payment',
      'description': 'Pay using UPI, cards, net banking - all payment methods accepted.',
    },
    {
      'step': '5',
      'title': 'Puja Performed by verified Pandits',
      'description': 'A verified pandit performs the puja with your sankalp on the chosen date.',
    },
    {
      'step': '6',
      'title': 'Receive updates & prasad',
      'description': 'Get puja updates, photos, videos on WhatsApp, and prasad delivered your door.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.creamBg, // Centralized cream background tone
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'THE PROCESS',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
              color: AppColors.warmGold, // Centralized luxury gold accent
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'How it works?',
            style: GoogleFonts.playfairDisplay(
              fontSize: 34,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryBrown, // Centralized deep earthy brown heading
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Simple, transparent, and performed with care.',
            style: TextStyle(fontSize: 15, color: AppColors.subtitleBrown), // Centralized subtitle tone
          ),
          const SizedBox(height: 50),
          LayoutBuilder(
            builder: (context, constraints) {
              bool isWide = constraints.maxWidth > 1000;
              if (isWide) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(_steps.length, (index) {
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: _buildStepItem(
                          stepNumber: _steps[index]['step']!,
                          title: _steps[index]['title']!,
                          description: _steps[index]['description']!,
                          showLine: index < _steps.length - 1,
                        ),
                      ),
                    );
                  }),
                );
              } else {
                return Column(
                  children: List.generate(_steps.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: _buildStepItem(
                        stepNumber: _steps[index]['step']!,
                        title: _steps[index]['title']!,
                        description: _steps[index]['description']!,
                        showLine: false,
                      ),
                    );
                  }),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildStepItem({
    required String stepNumber,
    required String title,
    required String description,
    required bool showLine,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            // Theme matching Golden/Brown Gradient Badge for Steps
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient, // Centralized primary gradient token
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.warmGold, width: 1.5),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primaryBrown.withValues(alpha: 0.25),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  stepNumber,
                  style: const TextStyle(
                    color: AppColors.lightGold, // Bright gold text for numbers
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            if (showLine)
              Expanded(
                child: Container(
                  height: 2,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.warmGold,
                        AppColors.warmGold.withValues(alpha: 0.2),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 18),
        Text(
          title,
          style: GoogleFonts.playfairDisplay(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryBrown,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          description,
          style: const TextStyle(
            fontSize: 12.5,
            color: AppColors.subtitleBrown,
            height: 1.4,
          ),
        ),
      ],
    );
  }
}
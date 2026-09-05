import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart'; // Centralized AppColors import kiya gaya hai

class AboutPhilosophySection extends StatelessWidget {
  const AboutPhilosophySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.creamBg, // Centralized cream background tone
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 80),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: LayoutBuilder(
            builder: (context, constraints) {
              bool isWide = constraints.maxWidth > 850;
              if (isWide) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Left Side: Title
                    Expanded(
                      flex: 5,
                      child: Text(
                        'The philosophy\nthat guides our\npractice',
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryBrown,
                          height: 1.2,
                        ),
                      ),
                    ),
                    const SizedBox(width: 40),
                    // Center: Vertical Divider with Diamond Icon
                    Column(
                      children: [
                        Container(height: 30, width: 1.5, color: AppColors.warmGold),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Icon(Icons.star, size: 14, color: AppColors.warmGold),
                        ),
                        Container(height: 30, width: 1.5, color: AppColors.warmGold),
                      ],
                    ),
                    const SizedBox(width: 50),
                    // Right Side: Description
                    Expanded(
                      flex: 6,
                      child: Text(
                        'True astrology is authentic, not superficial—a science meant to elevate, not exploit. Grounded in Vedic wisdom and driven by a profound sense of purpose, Shubham Kumar guides and empowers growth for thousands, bringing clarity and solutions to modern-day life challenges.',
                        style: TextStyle(
                          fontSize: 15.5,
                          color: AppColors.subtitleBrown,
                          height: 1.6,
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'The philosophy that guides our practice',
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryBrown,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'True astrology is authentic, not superficial—a science meant to elevate, not exploit. Grounded in Vedic wisdom and driven by a profound sense of purpose, Shubham Kumar guides and empowers growth for thousands, bringing clarity and solutions to modern-day life challenges.',
                      style: TextStyle(
                        fontSize: 15,
                        color: AppColors.subtitleBrown,
                        height: 1.6,
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
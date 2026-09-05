import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart'; // Centralized AppColors import kiya gaya hai

class WhyPoojanSection extends StatelessWidget {
  const WhyPoojanSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.creamBg, // Centralized cream background color
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Section Title
          Text(
            'Why Poojan?',
            style: GoogleFonts.playfairDisplay(
              fontSize: 34,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryBrown,
            ),
          ),
          const SizedBox(height: 35),

          // Main Content Card with Luxury Vedic Aesthetic
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 950),
            child: Container(
              padding: const EdgeInsets.all(35),
              decoration: BoxDecoration(
                color: const Color(0xFFF7F2EB), // Soft warm cream card background matching theme
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: AppColors.borderBrown.withValues(alpha: 0.6)),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primaryBrown.withValues(alpha: 0.06),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top Row: Brand & Creator Title
                  Row(
                    children: [
                      const Text(
                        'ॐ',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryBrown,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'POOJAN',
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                          color: AppColors.primaryBrown,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text('|', style: TextStyle(color: AppColors.warmGold, fontSize: 18)),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'By',
                            style: TextStyle(fontSize: 10, color: Color(0xFF9C6644), height: 1),
                          ),
                          const SizedBox(height: 2),
                          const Text(
                            'Shubham Kumar',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryBrown,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),

                  // Middle Row: Avatar & Description
                  LayoutBuilder(
                    builder: (context, constraints) {
                      bool isSmall = constraints.maxWidth < 600;
                      if (isSmall) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildAvatar(),
                            const SizedBox(height: 20),
                            _buildDescriptionText(),
                          ],
                        );
                      } else {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            _buildAvatar(),
                            const SizedBox(width: 30),
                            Expanded(child: _buildDescriptionText()),
                          ],
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 30),

                  // Bottom Badge: Guided by Shubham Kumar
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      gradient: AppColors.goldGradient, // Centralized gold gradient token
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.warmGold.withValues(alpha: 0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.verified_user, color: Colors.white, size: 16),
                        SizedBox(width: 8),
                        Text(
                          'Guided by Shubham Kumar',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAvatar() {
    return Container(
      width: 75,
      height: 75,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: AppColors.goldGradient,
        boxShadow: [
          BoxShadow(
            color: AppColors.warmGold.withValues(alpha: 0.4),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: const Padding(
        padding: EdgeInsets.all(3),
        child: CircleAvatar(
          backgroundColor: AppColors.primaryBrown,
          child: Icon(Icons.person, color: AppColors.lightGold, size: 38),
        ),
      ),
    );
  }

  Widget _buildDescriptionText() {
    return const Text(
      'Poojan is a dedicated puja platform built under the guidance and trust of Shubham Kumar. Every puja is performed by verified pandits at authentic temples, with a real sankalp taken in your name — so devotees in India and abroad can participate with complete peace of mind.',
      style: TextStyle(
        fontSize: 14.5,
        color: AppColors.primaryBrown,
        height: 1.6,
      ),
    );
  }
}
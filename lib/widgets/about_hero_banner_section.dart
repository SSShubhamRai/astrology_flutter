import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart'; // Centralized AppColors import kiya gaya hai

class AboutHeroBannerSection extends StatelessWidget {
  const AboutHeroBannerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.primaryBrown, // Centralized primary brown tone
      child: LayoutBuilder(
        builder: (context, constraints) {
          bool isWide = constraints.maxWidth > 900;
          if (isWide) {
            return Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 80),
                    child: _buildTextContent(),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: SizedBox(
                    height: 450,
                    child: Image.asset(
                      'assets/images/shubham .jpg',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: AppColors.deepBrown,
                        child: const Center(
                          child: Icon(Icons.temple_hindu, size: 80, color: AppColors.warmGold),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Column(
              children: [
                SizedBox(
                  height: 450,
                  child: Image.asset(
                    'assets/images/pooja_shiv.png', 
                    fit: BoxFit.contain,
                    alignment: Alignment.bottomCenter,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: AppColors.deepBrown,
                      child: const Center(
                        child: Icon(Icons.temple_hindu, size: 80, color: AppColors.warmGold),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(40),
                  child: _buildTextContent(),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  Widget _buildTextContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Every living soul is a universe in itself',
          style: GoogleFonts.playfairDisplay(
            fontSize: 38,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'When you experience true astrology, it uncovers your unique spark within the vast cosmos.',
          style: TextStyle(
            fontSize: 15.5,
            color: AppColors.borderBrown,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart'; // Centralized AppColors import kiya gaya hai

class AstrologicalJourneySection extends StatelessWidget {
  const AstrologicalJourneySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.creamBg, // Centralized cream background tone
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Main Section Title across both blocks
              Text(
                'How it all began',
                style: GoogleFonts.playfairDisplay(
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryBrown,
                ),
              ),
              const SizedBox(height: 60),

              // SECTION 1: Text on Left, Image on Right
              _buildStoryRow(
                isImageRight: true,
                imagePath: 'assets/images/astrology_book.png',
                fallbackIcon: Icons.menu_book_rounded,
                title: 'The journey of\nastrology through time',
                description:
                    'In ancient times, the art of astrology originated from cosmic science (astronomy) and mathematics. However, this association between astrology and science got lost over the centuries. It started getting misrepresented and tainted by fear-driven exploitation. As a result, many began to view it as a pseudo-science, stripped of its true essence.',
                highlights: [],
              ),

              const SizedBox(height: 80),

              // SECTION 2: Image on Left, Text on Right (with stats badges)
              _buildStoryRow(
                isImageRight: false,
                imagePath: 'assets/images/shubham .jpg',
                fallbackIcon: Icons.person,
                title: 'The origin of an\nastrological revolution',
                description:
                    'The platform was born from the desire to correct misconceptions, sharing a vision rooted in authenticity. Growing up immersed in traditional wisdom, learning astrology through the lens of science, logic, and the interconnectedness of all life with the universe. This rich generational wisdom now guides the brand, offering clarity and hope in a world filled with uncertainty.',
                highlights: [
                  'Gold Medalist & Certified',
                  '2,00,000+ Kundalis Served',
                  '1,00,000+ Consultations Given',
                  '30+ Celebrity Consultations',
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStoryRow({
    required bool isImageRight,
    required String imagePath,
    required IconData fallbackIcon,
    required String title,
    required String description,
    required List<String> highlights,
  }) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isWide = constraints.maxWidth > 850;

        final imageWidget = Container(
          width: 440,
          height: 340,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.warmGold.withValues(alpha: 0.5), width: 1.5),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.08),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: AppColors.primaryBrown,
                  child: Center(
                    child: Icon(fallbackIcon, size: 70, color: AppColors.warmGold),
                  ),
                );
              },
            ),
          ),
        );

        final textWidget = SizedBox(
          width: 540,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Decorative Timeline Indicator
              Row(
                children: [
                  Container(width: 1, height: 12, color: AppColors.warmGold),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 2),
                child: Text('♦', style: TextStyle(color: AppColors.warmGold, fontSize: 10)),
              ),
              Row(
                children: [
                  Container(width: 1, height: 12, color: AppColors.warmGold),
                ],
              ),
              const SizedBox(height: 12),

              // Title
              Text(
                title,
                style: GoogleFonts.playfairDisplay(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryBrown,
                  height: 1.15,
                ),
              ),
              const SizedBox(height: 16),

              // Description
              Text(
                description,
                style: const TextStyle(
                  fontSize: 14.5,
                  color: AppColors.subtitleBrown,
                  height: 1.6,
                ),
              ),

              // Optional Stats / Highlights Grid (used in section 2)
              if (highlights.isNotEmpty) ...[
                const SizedBox(height: 24),
                Wrap(
                  spacing: 20,
                  runSpacing: 10,
                  children: highlights.map((item) {
                    return SizedBox(
                      width: 245,
                      child: Row(
                        children: [
                          const Text('♦ ', style: TextStyle(color: AppColors.warmGold, fontSize: 10)),
                          Expanded(
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 12.5,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryBrown,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ],
            ],
          ),
        );

        if (isWide) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: isImageRight
                ? [textWidget, imageWidget]
                : [imageWidget, textWidget],
          );
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: isImageRight
                ? [textWidget, const SizedBox(height: 30), imageWidget]
                : [imageWidget, const SizedBox(height: 30), textWidget],
          );
        }
      },
    );
  }
}
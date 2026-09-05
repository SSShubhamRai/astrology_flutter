import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart'; // Centralized AppColors import kiya gaya hai

class FounderQuoteBannerSection extends StatelessWidget {
  const FounderQuoteBannerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // Central theme matching rich golden-brown background tone
      color: const Color(0xFFD4812F), 
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 70),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: LayoutBuilder(
            builder: (context, constraints) {
              bool isWide = constraints.maxWidth > 850;

              final quoteWidget = Expanded(
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Large Quote Icon / Marks
                    const Text(
                      '“',
                      style: TextStyle(
                        fontFamily: 'serif',
                        fontSize: 60,
                        color: Colors.white70,
                        height: 0.8,
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Main Quote Text
                    Text(
                      'Somewhere along the way, I made it my mission to bring true astrology back to guide beyond remedies and predictions.',
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        height: 1.4,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 30),
                    // Divider / Accent Lines
                    Row(
                      children: [
                        Container(width: 1, height: 12, color: AppColors.lightGold),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 2),
                      child: Text('♦', style: TextStyle(color: AppColors.lightGold, fontSize: 10)),
                    ),
                    Row(
                      children: [
                        Container(width: 1, height: 12, color: AppColors.lightGold),
                      ],
                    ),
                    const SizedBox(height: 12),
                    // Founder Name
                    const Text(
                      'Shubham',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 1.1,
                      ),
                    ),
                  ],
                ),
              );

              final imageWidget = Expanded(
                flex: 5,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: 380,
                    alignment: Alignment.bottomCenter,
                    child: Image.asset(
                      'assets/images/shubham .jpg',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 320,
                          decoration: BoxDecoration(
                            color: AppColors.primaryBrown.withValues(alpha: 0.3),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Center(
                            child: Icon(Icons.person, size: 100, color: Colors.white54),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              );

              if (isWide) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    quoteWidget,
                    const SizedBox(width: 40),
                    imageWidget,
                  ],
                );
              } else {
                return Column(
                  children: [
                    quoteWidget,
                    const SizedBox(height: 40),
                    imageWidget,
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
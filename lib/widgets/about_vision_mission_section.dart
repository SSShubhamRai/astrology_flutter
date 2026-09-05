import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart'; // Centralized AppColors import kiya gaya hai

class AboutVisionMissionSection extends StatelessWidget {
  const AboutVisionMissionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.creamBg, // Centralized cream background tone
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 60),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: LayoutBuilder(
            builder: (context, constraints) {
              bool isWide = constraints.maxWidth > 800;
              if (isWide) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: _buildCard(
                      icon: Icons.self_improvement,
                      title: 'Vision',
                      description: 'To empower everyone with authentic Vedic wisdom for achieving their life\'s true potential and solving real-life challenges.',
                    )),
                    const SizedBox(width: 30),
                    Expanded(child: _buildCard(
                      icon: Icons.local_florist,
                      title: 'Mission',
                      description: 'To solve problems and enable growth with accurate, practical, ethical, and reliable astrology.',
                    )),
                  ],
                );
              } else {
                return Column(
                  children: [
                    _buildCard(
                      icon: Icons.self_improvement,
                      title: 'Vision',
                      description: 'To empower everyone with authentic Vedic wisdom for achieving their life\'s true potential and solving real-life challenges.',
                    ),
                    const SizedBox(height: 30),
                    _buildCard(
                      icon: Icons.local_florist,
                      title: 'Mission',
                      description: 'To solve problems and enable growth with accurate, practical, ethical, and reliable astrology.',
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

  Widget _buildCard({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Container(
      height: 380,
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        gradient: AppColors.goldGradient, // Centralized gold/brown gradient tokens
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(icon, size: 45, color: Colors.white),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.playfairDisplay(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 15,
                  color: AppColors.creamBg, // Centralized cream tone
                  height: 1.5,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
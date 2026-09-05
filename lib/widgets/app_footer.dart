import 'package:flutter/material.dart';
import '../theme/app_colors.dart'; // Centralized AppColors import kiya gaya hai

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = AppColors.primaryBrown; // Centralized primary token

    return Container(
      width: double.infinity,
      color: primaryColor.withValues(alpha: 0.12), // Rich theme-tinted background
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Row: Brand & Links Group with Responsive Layout
              LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth > 768) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildBrandInfo(),
                        _buildLinksGroup('Quick Links', ['Home', 'Reports', 'Consultation', 'Spotlight'], primaryColor),
                        _buildLinksGroup('Legal & Privacy', ['Terms of Service', 'Privacy Policy', 'Refund Policy', 'Disclaimer'], primaryColor),
                        _buildLinksGroup('Support', ['Contact Us', 'FAQ', 'Help Center', 'My Account'], primaryColor),
                      ],
                    );
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildBrandInfo(),
                        const SizedBox(height: 40),
                        _buildLinksGroup('Quick Links', ['Home', 'Reports', 'Consultation', 'Spotlight'], primaryColor),
                        const SizedBox(height: 30),
                        _buildLinksGroup('Legal & Privacy', ['Terms of Service', 'Privacy Policy', 'Refund Policy', 'Disclaimer'], primaryColor),
                        const SizedBox(height: 30),
                        _buildLinksGroup('Support', ['Contact Us', 'FAQ', 'Help Center', 'My Account'], primaryColor),
                      ],
                    );
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Divider(color: primaryColor.withValues(alpha: 0.2)),
              ),
              // Bottom Row: Copyright & Social Icons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      '© 2026 Astro App Clone. All rights reserved.',
                      style: TextStyle(
                        color: primaryColor.withValues(alpha: 0.8),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      _buildSocialIcon(Icons.facebook, primaryColor),
                      const SizedBox(width: 16),
                      _buildSocialIcon(Icons.camera_alt_rounded, primaryColor),
                      const SizedBox(width: 16),
                      _buildSocialIcon(Icons.play_arrow_rounded, primaryColor),
                      const SizedBox(width: 16),
                      _buildSocialIcon(Icons.chat_bubble_rounded, primaryColor),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBrandInfo() {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 320),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Astro App',
            style: TextStyle(
              fontFamily: 'serif',
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryBrown,
            ),
          ),
          SizedBox(height: 12),
          Text(
            'Your ultimate destination for authentic Vedic astrology, numerology insights, and expert consultations to navigate your life path.',
            style: TextStyle(
              color: AppColors.subtitleBrown,
              fontSize: 14,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLinksGroup(String title, List<String> links, Color primaryColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: primaryColor,
          ),
        ),
        const SizedBox(height: 16),
        ...links.map((link) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Text(
                  link,
                  style: TextStyle(
                    color: AppColors.subtitleBrown,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            )),
      ],
    );
  }

  Widget _buildSocialIcon(IconData icon, Color primaryColor) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: primaryColor.withValues(alpha: 0.1),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, size: 18, color: primaryColor),
    );
  }
}
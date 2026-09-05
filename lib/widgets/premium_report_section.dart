import 'package:flutter/material.dart';
import '../theme/app_colors.dart'; // Centralized AppColors import kiya gaya hai

class PremiumReportSection extends StatelessWidget {
  const PremiumReportSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.creamBg, // Centralized cream background tone
      padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 40),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 60,
            runSpacing: 40,
            children: [
              // Left Side: Report Book Mockup Image
              Container(
                width: 320,
                height: 420,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.15),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    'assets/images/report_book.png',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: AppColors.primaryBrown,
                        child: const Center(
                          child: Icon(Icons.book, size: 80, color: AppColors.warmGold),
                        ),
                      );
                    },
                  ),
                ),
              ),

              // Right Side: Content, Features, Pricing & Button
              SizedBox(
                width: 650,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Premium Personalised\nNumerology Report',
                      style: TextStyle(
                        fontFamily: 'serif',
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryBrown,
                        height: 1.15,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Know yourself better. Live with greater clarity.',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.subtitleBrown,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Feature Bullet Points (Removed 'const' keyword before children list to allow dynamic/runtime items properly)
                    Wrap(
                      spacing: 40,
                      runSpacing: 16,
                      children: const [
                        _FeatureItem(text: '250+ Page Detailed Report'),
                        _FeatureItem(text: 'Comprehensive Numerology Analysis'),
                        _FeatureItem(text: 'Career & Relationship Guidance'),
                        _FeatureItem(text: 'Personalized Insights & Remedies'),
                        _FeatureItem(text: 'Available in Hindi, English & More'),
                      ],
                    ),
                    const SizedBox(height: 32),

                    // Pricing Row
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          '₹499',
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryBrown,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 6.0),
                          child: Text(
                            '₹1,999',
                            style: TextStyle(
                              fontSize: 18,
                              decoration: TextDecoration.lineThrough,
                              color: AppColors.primaryBrown.withValues(alpha: 0.5),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 6.0),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: const Color(0xFFE2F6EE),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              'Save 75%',
                              style: TextStyle(
                                color: Color(0xFF0D9488),
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // CTA Button using Centralized Theme
                    Container(
                      decoration: BoxDecoration(
                        gradient: AppColors.goldGradient, // Centralized gold gradient token
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.warmGold.withValues(alpha: 0.4),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          foregroundColor: AppColors.primaryBrown,
                          padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () {},
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Get My Numerology Report',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 10),
                            Icon(Icons.arrow_forward, size: 18),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Helper widget for individual feature tick items
class _FeatureItem extends StatelessWidget {
  final String text;
  const _FeatureItem({required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check, size: 18, color: AppColors.warmGold),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.subtitleBrown,
                fontWeight: FontWeight.w500,
                height: 1.3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
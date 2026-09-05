import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart'; // Centralized AppColors import kiya gaya hai

class ExpertPlansSection extends StatefulWidget {
  const ExpertPlansSection({super.key});

  @override
  State<ExpertPlansSection> createState() => _ExpertPlansSectionState();
}

class _ExpertPlansSectionState extends State<ExpertPlansSection> {
  final List<bool> _isNormalMode = [true, true, true];
  int _hoveredCardIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.creamBg, // Centralized cream background tone
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.warmGold.withValues(alpha: 0.6)),
              borderRadius: BorderRadius.circular(20),
              color: AppColors.deepBrown.withValues(alpha: 0.05),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.auto_awesome, color: AppColors.deepBrown, size: 14),
                SizedBox(width: 8),
                Text(
                  'EXPERT GUIDANCE PLANS',
                  style: TextStyle(
                    color: AppColors.deepBrown,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Choose Your Expert Guidance Plan',
            style: GoogleFonts.playfairDisplay(
              fontSize: 42,
              fontWeight: FontWeight.bold,
              color: AppColors.deepBrown,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Select a consultation tier that best fits your requirements and timeline.',
            style: TextStyle(
              fontSize: 15,
              color: AppColors.subtitleBrown,
            ),
          ),
          const SizedBox(height: 50),
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 1050) {
                return IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(child: _buildPricingCard(0, 'Recommended', 'Elite Certified Astrologers', 'Selected for expertise, accuracy & trust', ['Personalized guidance for career, finance & relationships', 'Easy-to-follow solutions for everyday concerns', 'Clear and honest guidance without fear-based advice', 'Personalized remedies based on your birth chart'], ['30-minute consultation', 'Schedule your session immediately', 'Personalized guidance during the session'], '₹2,499', '₹3,499')),
                      const SizedBox(width: 24),
                      Expanded(child: _buildPricingCard(1, 'Most Popular', 'Senior Numerology Expert', '10+ Years Experience • 5,000+ Consultations', ['Detailed numerology and life-path analysis', 'Career, relationship and financial guidance', 'Practical recommendations based on your numbers', 'Clear answers to your most important questions'], ['30-minute consultation', 'Priority appointment availability', 'Personalized guidance during the session'], '₹2,999', '₹4,199')),
                      const SizedBox(width: 24),
                      Expanded(child: _buildPricingCard(2, 'Premium', 'Premium Expert Consultation', 'Highly Experienced • Personalized Guidance', ['Deep analysis of your personal concerns', 'Career, love, marriage and life guidance', 'Personalized remedies and recommendations', 'Focused one-to-one consultation'], ['45-minute consultation', 'Priority scheduling', 'Detailed personalized guidance'], '₹3,999', '₹5,499')),
                    ],
                  ),
                );
              } else {
                return Column(
                  children: [
                    _buildPricingCard(0, 'Recommended', 'Elite Certified Astrologers', 'Selected for expertise, accuracy & trust', ['Personalized guidance for career, finance & relationships', 'Easy-to-follow solutions for everyday concerns', 'Clear and honest guidance without fear-based advice', 'Personalized remedies based on your birth chart'], ['30-minute consultation', 'Schedule your session immediately', 'Personalized guidance during the session'], '₹2,499', '₹3,499'),
                    const SizedBox(height: 30),
                    _buildPricingCard(1, 'Most Popular', 'Senior Numerology Expert', '10+ Years Experience • 5,000+ Consultations', ['Detailed numerology and life-path analysis', 'Career, relationship and financial guidance', 'Practical recommendations based on your numbers', 'Clear answers to your most important questions'], ['30-minute consultation', 'Priority appointment availability', 'Personalized guidance during the session'], '₹2,999', '₹4,199'),
                    const SizedBox(height: 30),
                    _buildPricingCard(2, 'Premium', 'Premium Expert Consultation', 'Highly Experienced • Personalized Guidance', ['Deep analysis of your personal concerns', 'Career, love, marriage and life guidance', 'Personalized remedies and recommendations', 'Focused one-to-one consultation'], ['45-minute consultation', 'Priority scheduling', 'Detailed personalized guidance'], '₹3,999', '₹5,499'),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPricingCard(
    int cardIndex,
    String badgeText,
    String title,
    String subtitle,
    List<String> knownForList,
    List<String> detailsList,
    String normalPrice,
    String urgentPrice,
  ) {
    bool isNormal = _isNormalMode[cardIndex];
    bool isHighlighted = _hoveredCardIndex == cardIndex;

    return MouseRegion(
      onEnter: (_) => setState(() => _hoveredCardIndex = cardIndex),
      child: GestureDetector(
        onTap: () => setState(() => _hoveredCardIndex = cardIndex),
        child: AnimatedScale(
          scale: isHighlighted ? 1.03 : 1.0,
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            decoration: BoxDecoration(
              color: isHighlighted ? const Color(0xFFFFFBF0) : Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: isHighlighted ? AppColors.warmGold : AppColors.warmGold.withValues(alpha: 0.4),
                width: isHighlighted ? 1.8 : 1.0,
              ),
              boxShadow: [
                BoxShadow(
                  color: isHighlighted ? AppColors.warmGold.withValues(alpha: 0.2) : Colors.black.withValues(alpha: 0.04),
                  blurRadius: isHighlighted ? 22 : 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: isHighlighted ? AppColors.warmGold : const Color(0xFFFAF3E0),
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(19)),
                  ),
                  child: Text(
                    badgeText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: isHighlighted ? Colors.white : AppColors.deepBrown,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.deepBrown.withValues(alpha: 0.06),
                              border: Border.all(color: AppColors.warmGold.withValues(alpha: 0.4)),
                            ),
                            child: const Center(
                              child: Text(
                                'E',
                                style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.warmGold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          title,
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.deepBrown,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          subtitle,
                          style: TextStyle(fontSize: 12.5, color: Colors.grey[700]),
                        ),
                        const Divider(height: 30, thickness: 1),
                        const Text(
                          'KNOWN FOR',
                          style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.deepBrown, letterSpacing: 1.0),
                        ),
                        const SizedBox(height: 10),
                        ...knownForList.map((item) => Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(Icons.check, size: 14, color: AppColors.warmGold),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(item, style: TextStyle(fontSize: 12.5, color: Colors.grey[800], height: 1.3)),
                                  ),
                                ],
                              ),
                            )),
                        const Divider(height: 25, thickness: 1),
                        const Text(
                          'CONSULTATION DETAILS',
                          style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.deepBrown, letterSpacing: 1.0),
                        ),
                        const SizedBox(height: 10),
                        ...detailsList.map((detail) => Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Row(
                                children: [
                                  const Icon(Icons.access_time_rounded, size: 14, color: AppColors.warmGold),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(detail, style: TextStyle(fontSize: 12.5, color: Colors.grey[800])),
                                  ),
                                ],
                              ),
                            )),
                        const Divider(height: 25, thickness: 1),
                        const Text(
                          'CHOOSE MODE',
                          style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.deepBrown, letterSpacing: 1.0),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: AppColors.creamBg,
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(color: AppColors.warmGold.withValues(alpha: 0.4)),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () => setState(() => _isNormalMode[cardIndex] = true),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(vertical: 8),
                                    decoration: BoxDecoration(
                                      color: isNormal ? AppColors.deepBrown : Colors.transparent,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      'Normal',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: isNormal ? Colors.white : AppColors.deepBrown,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () => setState(() => _isNormalMode[cardIndex] = false),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(vertical: 8),
                                    decoration: BoxDecoration(
                                      color: !isNormal ? AppColors.deepBrown : Colors.transparent,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      'Urgent',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: !isNormal ? Colors.white : AppColors.deepBrown,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Divider(height: 30, thickness: 1),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Consultation Fee', style: TextStyle(fontSize: 10, color: Colors.grey)),
                                const SizedBox(height: 2),
                                Text(
                                  isNormal ? normalPrice : urgentPrice,
                                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.deepBrown),
                                ),
                                Text(
                                  isNormal ? 'Standard consultation' : 'Priority consultation',
                                  style: const TextStyle(fontSize: 9.5, color: Colors.grey),
                                ),
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                gradient: AppColors.goldGradient,
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.warmGold.withValues(alpha: 0.4),
                                    blurRadius: 8,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                  foregroundColor: AppColors.deepBrown,
                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                onPressed: () {},
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text('Consult Now', style: TextStyle(fontSize: 12.5, fontWeight: FontWeight.bold)),
                                    SizedBox(width: 4),
                                    Icon(Icons.arrow_forward, size: 14),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
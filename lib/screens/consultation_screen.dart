import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_colors.dart'; // Centralized AppColors import kiya gaya hai
import '../widgets/custom_navbar.dart';
import '../widgets/app_footer.dart';
import '../widgets/consultation_info_section.dart';
import '../widgets/why_choose_us_section.dart';
import '../widgets/how_it_works_section.dart';
import '../widgets/expert_plans_section.dart';
import '../widgets/vastu_consultant_section.dart';
import '../widgets/cta_banner_section.dart';
import '../widgets/consultation_faq_section.dart';

class ConsultationScreen extends StatelessWidget {
  const ConsultationScreen({super.key});

  // Google Form open karne ki function
  Future<void> _bookConsultation(BuildContext context) async {
    final Uri url = Uri.parse('https://docs.google.com/forms/d/e/1FAIpQLSfheuBKfCbYE00rQsH9Yd50n9ap_i-uI5lVqGhnzOh37o6Pzg/viewform?usp=publish-editor'); // Yahan apna Google Form link paste karein
    
    try {
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      } else {
        throw 'Could not launch $url';
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not open booking form: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.creamBg,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                // 1. CONSULTATION HERO SECTION WITH FULL BACKGROUND IMAGE
                Container(
                  width: double.infinity,
                  constraints: const BoxConstraints(minHeight: 650),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [AppColors.primaryBrown, AppColors.deepBrown, Color(0xFF2A1203)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    image: DecorationImage(
                      image: const AssetImage('assets/images/consultation_hero.png'),
                      fit: BoxFit.cover,
                      alignment: Alignment.centerRight,
                      colorFilter: ColorFilter.mode(
                        AppColors.primaryBrown.withValues(alpha: 0.6),
                        BlendMode.darken,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 120), // Navbar spacing

                        // Left Aligned Text Content over the background
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 600),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Small Top Outline Badge
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                                decoration: BoxDecoration(
                                  border: Border.all(color: AppColors.warmGold.withValues(alpha: 0.6)),
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.black.withValues(alpha: 0.3),
                                ),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.auto_awesome, color: AppColors.warmGold, size: 14),
                                    SizedBox(width: 8),
                                    Text(
                                      'PERSONALIZED ASTROLOGY CONSULTATION',
                                      style: TextStyle(
                                        color: AppColors.borderBrown,
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1.2,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 24),

                              // Main Heading
                              Text(
                                'Get Clarity.\nFind Your Direction.',
                                style: GoogleFonts.playfairDisplay(
                                  fontSize: 52,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  height: 1.15,
                                ),
                              ),
                              const SizedBox(height: 20),

                              // Description
                              const Text(
                                'Talk to experienced astrologers and get personalized guidance for the questions that matter most in your life.',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: AppColors.borderBrown,
                                  height: 1.6,
                                ),
                              ),
                              const SizedBox(height: 32),

                              // Social Proof Pill
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.95),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      '50K+ Happy Customers',
                                      style: TextStyle(
                                        color: AppColors.deepBrown,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 10),
                                      child: Text('|', style: TextStyle(color: Colors.grey)),
                                    ),
                                    Text(
                                      'Trusted Guidance',
                                      style: TextStyle(
                                        color: AppColors.deepBrown,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 36),

                              // CTA Button
                              Container(
                                decoration: BoxDecoration(
                                  gradient: AppColors.goldGradient,
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.warmGold.withValues(alpha: 0.4),
                                      blurRadius: 12,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    shadowColor: Colors.transparent,
                                    foregroundColor: AppColors.deepBrown,
                                    padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                  onPressed: () => _bookConsultation(context),
                                  child: const Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Book Your Consultation',
                                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
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
                        const SizedBox(height: 80),
                      ],
                    ),
                  ),
                ),

                const ConsultationInfoSection(),
                const WhyChooseUsSection(),
                const HowItWorksSection(),
                const ExpertPlansSection(),
                const VastuConsultantSection(),
                const ConsultationFaqSection(),
                const CtaBannerSection(),

                // 2. FOOTER
                const AppFooter(),
              ],
            ),
          ),

          // FIXED NAVBAR
          const Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: CustomNavbar(),
          ),
        ],
      ),
    );
  }
}
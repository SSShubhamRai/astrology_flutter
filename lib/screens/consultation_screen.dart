import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      colors: [Color(0xFF3D1C06), Color(0xFF5B2C0E), Color(0xFF2A1203)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    image: DecorationImage(
                      image: const AssetImage('assets/images/consultation_hero.png'),
                      fit: BoxFit.cover,
                      alignment: Alignment.centerRight,
                      colorFilter: ColorFilter.mode(
                        const Color(0xFF3D1C06).withValues(alpha: 0.6),
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
                                  border: Border.all(color: const Color(0xFFD4A373).withValues(alpha: 0.6)),
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.black.withValues(alpha: 0.3),
                                ),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.auto_awesome, color: Color(0xFFD4A373), size: 14),
                                    SizedBox(width: 8),
                                    Text(
                                      'PERSONALIZED ASTROLOGY CONSULTATION',
                                      style: TextStyle(
                                        color: Color(0xFFE6CCB2),
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
                                  color: Color(0xFFE6CCB2),
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
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: const [
                                    Text(
                                      '50K+ Happy Customers',
                                      style: TextStyle(
                                        color: Color(0xFF5B2C0E),
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
                                        color: Color(0xFF5B2C0E),
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
                                  gradient: const LinearGradient(
                                    colors: [Color(0xFFE9C46A), Color(0xFFD4A373)],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0xFFD4A373).withValues(alpha: 0.4),
                                      blurRadius: 12,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    shadowColor: Colors.transparent,
                                    foregroundColor: const Color(0xFF5B2C0E),
                                    padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                  onPressed: () {},
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
               
                ConsultationFaqSection(),
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
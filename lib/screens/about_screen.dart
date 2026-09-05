import 'package:flutter/material.dart';
import '../theme/app_colors.dart'; // Centralized AppColors import kiya gaya hai
import '../widgets/custom_navbar.dart';
import '../widgets/app_footer.dart';
import '../widgets/about_hero_banner_section.dart';
import '../widgets/about_philosophy_section.dart';
import '../widgets/about_vision_mission_section.dart';
import '../widgets/astrological_journey_section.dart';
import '../widgets/founder_quote_banner_section.dart';
import '../widgets/celebrity_conversations_section.dart';
import '../widgets/call_and_show_section.dart';



class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.creamBg, // Centralized cream background
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 80), // Navbar spacing
                AboutHeroBannerSection(),
                AboutPhilosophySection(),
                AboutVisionMissionSection(),
                AstrologicalJourneySection(),
                FounderQuoteBannerSection(),
                CelebrityConversationsSection(),
                CallAndShowSection(),

                AppFooter(),
              ],
            ),
          ),
          Positioned(
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
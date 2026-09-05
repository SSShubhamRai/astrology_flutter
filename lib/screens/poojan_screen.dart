import 'package:flutter/material.dart';
import '../theme/app_colors.dart'; // Centralized AppColors import kiya gaya hai
import '../widgets/custom_navbar.dart';
import '../widgets/app_footer.dart';
import '../widgets/poojan_split_carousel.dart';
import '../widgets/all_pujas_grid_section.dart';
import '../widgets/puja_process_section.dart';
import '../widgets/why_poojan_section.dart';
import '../widgets/devotee_reviews_section.dart';
import '../widgets/puja_whatsapp_support_section.dart';

class PoojanScreen extends StatelessWidget {
  const PoojanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.creamBg, // Centralized cream background
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 50), // Navbar spacing
                PoojanSplitCarousel(),
                AllPujasGridSection(),
                PujaProcessSection(),
                WhyPoojanSection(),
                DevoteeReviewsSection(),
                PujaWhatsappSupportSection(),
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
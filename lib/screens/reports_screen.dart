import 'package:flutter/material.dart';
import '../theme/app_colors.dart'; // Centralized AppColors import kiya gaya hai
import '../widgets/custom_navbar.dart';
import '../widgets/app_footer.dart';
import '../widgets/interactive_reports_carousel.dart';
import '../widgets/reports_grid_section.dart'; 
import '../widgets/most_chosen_reports_section.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.creamBg, // Centralized cream background
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 100), // Navbar spacing
                InteractiveReportsCarousel(),
                ReportsGridSection(),
                MostChosenReportsSection(),
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
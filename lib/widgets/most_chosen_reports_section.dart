import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart'; // Centralized AppColors import kiya gaya hai

class MostChosenReportsSection extends StatefulWidget {
  const MostChosenReportsSection({super.key});

  @override
  State<MostChosenReportsSection> createState() => _MostChosenReportsSectionState();
}

class _MostChosenReportsSectionState extends State<MostChosenReportsSection> {
  String _selectedFilter = 'All';

  final List<Map<String, dynamic>> _allReports = [
    {
      'title': 'Premium Personalized Kundli',
      'subtitle': 'Know Your Future with Kundli',
      'category': 'Popular',
      'image': 'assets/images/kundli_book.png',
      'oldPrice': '₹1,100',
      'price': '₹499/-',
    },
    {
      'title': 'Soul Purpose Report',
      'subtitle': 'Find Your True Life Purpose',
      'category': 'Trending',
      'image': 'assets/images/kundli_book.png',
      'oldPrice': '₹1,999',
      'price': '₹499/-',
    },
    {
      'title': 'Couple Kundli Matching Report',
      'subtitle': 'Before You Say "Yes," See What the Universe Says',
      'category': 'Popular',
      'image': 'assets/images/kundli_book.png',
      'oldPrice': '₹1,022',
      'price': '₹511/-',
    },
    {
      'title': 'Career & Wealth Blueprint',
      'subtitle': 'Unlock Your Professional Growth',
      'category': 'Trending',
      'image': 'assets/images/kundli_book.png',
      'oldPrice': '₹1,500',
      'price': '₹699/-',
    },
    {
      'title': 'Health & Longevity Guide',
      'subtitle': 'Maintain Vitality and Well-being',
      'category': 'Popular',
      'image': 'assets/images/kundli_book.png',
      'oldPrice': '₹1,299',
      'price': '₹599/-',
    },
    {
      'title': 'Business & Success Insights',
      'subtitle': 'Scale Up Your Ventures with Astrology',
      'category': 'Trending',
      'image': 'assets/images/kundli_book.png',
      'oldPrice': '₹2,499',
      'price': '₹999/-',
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Filter logic based on selected tab
    final filteredReports = _selectedFilter == 'All'
        ? _allReports
        : _allReports.where((item) => item['category'] == _selectedFilter).toList();

    return Container(
      width: double.infinity,
      color: AppColors.creamBg, // Centralized cream background tone
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Section Header
          Text(
            "Most-Chosen By Our Users",
            textAlign: TextAlign.center,
            style: GoogleFonts.playfairDisplay(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryBrown, // Centralized primary brown tone
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'The reports that have helped people find solutions, direction, and peace',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15, color: AppColors.subtitleBrown),
          ),
          const SizedBox(height: 30),

          // Filters Row (All, Popular, Trending)
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: ['All', 'Popular', 'Trending'].map((filter) {
              bool isSelected = _selectedFilter == filter;
              return Padding(
                padding: const EdgeInsets.only(right: 24.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedFilter = filter;
                    });
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        filter,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: isSelected ? AppColors.primaryBrown : AppColors.primaryBrown.withValues(alpha: 0.5),
                        ),
                      ),
                      const SizedBox(height: 6),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        height: 2,
                        width: isSelected ? 24 : 0,
                        color: AppColors.primaryBrown,
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 30),
          const Divider(color: AppColors.borderBrown, thickness: 0.8),
          const SizedBox(height: 40),

          // Cards Grid/Wrap Layout
          Wrap(
            spacing: 24,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: filteredReports.map((report) {
              return Container(
                width: 340,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.warmGold.withValues(alpha: 0.3)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.04),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Vertical Standing Book Image
                    Center(
                      child: Container(
                        height: 220,
                        margin: const EdgeInsets.only(bottom: 16),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            report['image'],
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => Container(
                              width: 140,
                              color: AppColors.primaryBrown,
                              child: const Center(
                                child: Icon(Icons.menu_book_rounded, size: 50, color: AppColors.warmGold),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Title & Subtitle
                    Text(
                      report['title'],
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryBrown,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      report['subtitle'],
                      style: const TextStyle(fontSize: 12, color: AppColors.subtitleBrown),
                    ),
                    const SizedBox(height: 20),

                    // Pricing & Buy Now Button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              report['oldPrice'],
                              style: const TextStyle(
                                fontSize: 13,
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              report['price'],
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryBrown,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),

                    // Gold Gradient Buy Now Button
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: AppColors.goldGradient, // Centralized gold gradient token
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          foregroundColor: AppColors.primaryBrown,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {},
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'BUY NOW',
                              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1),
                            ),
                            SizedBox(width: 6),
                            Icon(Icons.arrow_forward, size: 14),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart'; // Centralized AppColors import kiya gaya hai

class InteractiveReportsCarousel extends StatefulWidget {
  const InteractiveReportsCarousel({super.key});

  @override
  State<InteractiveReportsCarousel> createState() => _InteractiveReportsCarouselState();
}

class _InteractiveReportsCarouselState extends State<InteractiveReportsCarousel> {
  late PageController _pageController;
  int _currentIndex = 5000;
  Timer? _autoScrollTimer;

  final List<Map<String, String>> _reportsList = [
    {'title': 'Career & Wealth Report', 'image': 'assets/images/report_career.png', 'price': '₹1,100'},
    {'title': 'Marriage & Love Report', 'image': 'assets/images/report_marriage.png', 'price': '₹1,500'},
    {'title': 'Life Path & Destiny Book', 'image': 'assets/images/report_destiny.png', 'price': '₹2,100'},
    {'title': 'Health & Longevity Guide', 'image': 'assets/images/report_health.png', 'price': '₹1,800'},
    {'title': 'Business & Success Insights', 'image': 'assets/images/report_business.png', 'price': '₹2,500'},
  ];

  @override
  void initState() {
    super.initState();
    // ViewportFraction ko 0.22 kiya gaya hai taaki cards bilkul paas aur compact ho jayein
    _pageController = PageController(viewportFraction: 0.22, initialPage: _currentIndex);
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _autoScrollTimer = Timer.periodic(const Duration(milliseconds: 2200), (timer) {
      if (_pageController.hasClients) {
        _currentIndex++;
        _pageController.animateToPage(
          _currentIndex,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOutCubic,
        );
      }
    });
  }

  @override
  void dispose() {
    _autoScrollTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.creamBg, // Centralized cream background tone
      padding: const EdgeInsets.symmetric(vertical: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Top Badge
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
                  'PERSONALIZED REPORTS',
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

          // Main Heading
          Text(
            "Answers For Your Life's Important Questions",
            textAlign: TextAlign.center,
            style: GoogleFonts.playfairDisplay(
              fontSize: 42,
              fontWeight: FontWeight.bold,
              color: AppColors.deepBrown,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Explore personalized reports designed to give you clarity about your career, relationships, finances, personality and life path.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15, color: AppColors.subtitleBrown),
          ),
          const SizedBox(height: 50),

          // Infinite Seamless Loop Carousel
          SizedBox(
            height: 440,
            child: PageView.builder(
              controller: _pageController,
              itemCount: 1000000,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                int dataIndex = index % _reportsList.length;
                bool isSelected = (_currentIndex % _reportsList.length) == dataIndex;

                return AnimatedBuilder(
                  animation: _pageController,
                  builder: (context, child) {
                    double value = 1.0;
                    if (_pageController.position.haveDimensions) {
                      value = (_pageController.page! - index).abs();
                      value = (1 - (value * 0.2)).clamp(0.78, 1.12);
                    }

                    return Center(
                      child: SizedBox(
                        height: Curves.easeOut.transform(value) * 380,
                        width: Curves.easeOut.transform(value) * 240, // Proportional width for book layout
                        child: child,
                      ),
                    );
                  },
                  child: MouseRegion(
                    onEnter: (_) => _autoScrollTimer?.cancel(),
                    onExit: (_) => _startAutoScroll(),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _currentIndex = index;
                        });
                        _pageController.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 6), // Compact gap between books
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: isSelected ? AppColors.warmGold : AppColors.warmGold.withValues(alpha: 0.3),
                            width: isSelected ? 2.5 : 1.0,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: isSelected ? AppColors.warmGold.withValues(alpha: 0.4) : Colors.black.withValues(alpha: 0.05),
                              blurRadius: isSelected ? 24 : 10,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                                child: Container(
                                  color: AppColors.primaryBrown.withValues(alpha: 0.08),
                                  child: const Center(
                                    child: Icon(Icons.menu_book_rounded, size: 55, color: AppColors.deepBrown),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Column(
                                children: [
                                  Text(
                                    _reportsList[dataIndex]['title']!,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.playfairDisplay(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.deepBrown,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    _reportsList[dataIndex]['price']!,
                                    style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.warmGold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
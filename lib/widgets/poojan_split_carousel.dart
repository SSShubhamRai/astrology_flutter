import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart'; // Centralized AppColors import kiya gaya hai

class PoojanSplitCarousel extends StatefulWidget {
  const PoojanSplitCarousel({super.key});

  @override
  State<PoojanSplitCarousel> createState() => _PoojanSplitCarouselState();
}

class _PoojanSplitCarouselState extends State<PoojanSplitCarousel> {
  int _currentIndex = 0;
  Timer? _autoScrollTimer;

  final List<Map<String, String>> _poojasList = [
    {
      'badge': 'For Peace & Protection',
      'title': 'Shiv Pujan & Rudrabhishek',
      'subtitle': 'Embrace peace, positivity, and divine blessings in your life.',
      'image': 'assets/images/pooja_shiv.png',
    },
    {
      'badge': 'Health & Longevity',
      'title': 'Maha Mrityunjaya Jaap & Homa',
      'subtitle': 'For divine protection, longevity, and freedom from ailments.',
      'image': 'assets/images/ganesh.png',
    },
    {
      'badge': 'Wealth & Prosperity',
      'title': 'Kuber & Lakshmi Special Puja',
      'subtitle': 'Invite financial stability, growth, and abundance into your home.',
      'image': 'assets/images/gauri.png',
    },
    {
      'badge': 'Relationship & Harmony',
      'title': 'Gauri Shankar Vivah Puja',
      'subtitle': 'Resolve marital conflicts and attract true love and harmony.',
      'image': 'assets/images/krishna.png',
    },
    {
      'badge': 'Career & Success',
      'title': 'Ganesha & Surya Success Puja',
      'subtitle': 'Remove obstacles from your career and achieve glorious success.',
      'image': 'assets/images/pooja_shiv.png',
    },
    {
      'badge': 'Dosha Nivaran',
      'title': 'Kaal Sarp Dosha Shanti Puja',
      'subtitle': 'Nullify malefic planetary effects and bring stability.',
      'image': 'assets/images/pooja_shiv.png',
    },
  ];

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _autoScrollTimer = Timer.periodic(const Duration(milliseconds: 4000), (timer) {
      if (mounted) {
        setState(() {
          _currentIndex = (_currentIndex + 1) % _poojasList.length;
        });
      }
    });
  }

  @override
  void dispose() {
    _autoScrollTimer?.cancel();
    super.dispose();
  }

  void _nextCard() {
    _autoScrollTimer?.cancel();
    setState(() {
      _currentIndex = (_currentIndex + 1) % _poojasList.length;
    });
    _startAutoScroll();
  }

  void _prevCard() {
    _autoScrollTimer?.cancel();
    setState(() {
      _currentIndex = (_currentIndex - 1 + _poojasList.length) % _poojasList.length;
    });
    _startAutoScroll();
  }

  @override
  Widget build(BuildContext context) {
    final activeItem = _poojasList[_currentIndex];

    return Container(
      width: double.infinity,
      color: AppColors.creamBg, // Centralized cream background tone
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Section Title & View All
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Divine Pujas For Your Well-Being',
                style: GoogleFonts.playfairDisplay(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryBrown,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Row(
                  children: [
                    Text('View all', style: TextStyle(color: AppColors.deepBrown, fontWeight: FontWeight.bold)),
                    SizedBox(width: 4),
                    Icon(Icons.arrow_forward, size: 14, color: AppColors.deepBrown),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),

          // Split Layout: Left Content & Right Stacked Cards
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // LEFT SIDE: Dynamic Content
              Expanded(
                flex: 40,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.warmGold.withValues(alpha: 0.6)),
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.deepBrown.withValues(alpha: 0.05),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.auto_awesome, color: AppColors.deepBrown, size: 13),
                          const SizedBox(width: 6),
                          Text(
                            activeItem['badge']!,
                            style: const TextStyle(
                              color: AppColors.deepBrown,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      activeItem['title']!,
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryBrown,
                        height: 1.15,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      activeItem['subtitle']!,
                      style: const TextStyle(fontSize: 15, color: AppColors.subtitleBrown, height: 1.5),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Performed by verified pandits with your name and gotra. Receive photos and videos on WhatsApp.',
                      style: TextStyle(fontSize: 13, color: Color(0xFF9C6644), height: 1.4),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      decoration: BoxDecoration(
                        gradient: AppColors.goldGradient, // Centralized gold gradient token
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
                          foregroundColor: AppColors.primaryBrown,
                          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () {},
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Book This Puja',
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 8),
                            Icon(Icons.arrow_forward, size: 16),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 40),

              // RIGHT SIDE: Perfect Stacked Zoom & Blur Effect
              Expanded(
                flex: 60,
                child: Column(
                  children: [
                    SizedBox(
                      height: 400,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          MouseRegion(
                            onEnter: (_) => _autoScrollTimer?.cancel(),
                            onExit: (_) => _startAutoScroll(),
                            child: SizedBox(
                              width: 480,
                              height: 340,
                              child: Stack(
                                alignment: Alignment.center,
                                children: List.generate(_poojasList.length, (i) {
                                  int actualIndex = (_currentIndex + (_poojasList.length - 1 - i)) % _poojasList.length;
                                  
                                  int offset = (actualIndex - _currentIndex) % _poojasList.length;
                                  if (offset < 0) offset += _poojasList.length;

                                  bool isTop = (offset == 0);
                                  bool isSecond = (offset == 1 || offset == _poojasList.length - 1);

                                  if (offset > 1 && offset < _poojasList.length - 1) {
                                    return const SizedBox.shrink();
                                  }

                                  double scale = isTop ? 1.0 : 0.92;
                                  double offsetY = isTop ? 0.0 : 30.0;
                                  double blurSigma = isTop ? 0.0 : 5.0;
                                  double opacity = isTop ? 1.0 : 0.6;

                                  final item = _poojasList[actualIndex];

                                  return AnimatedPositioned(
                                    key: ValueKey('card_$actualIndex'),
                                    duration: const Duration(milliseconds: 600),
                                    curve: Curves.easeInOutCubic,
                                    top: offsetY,
                                    child: AnimatedScale(
                                      duration: const Duration(milliseconds: 600),
                                      curve: Curves.easeInOutCubic,
                                      scale: scale,
                                      child: ImageFiltered(
                                        imageFilter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
                                        child: AnimatedOpacity(
                                          duration: const Duration(milliseconds: 600),
                                          opacity: opacity,
                                          child: Container(
                                            width: 480,
                                            height: 320,
                                            decoration: BoxDecoration(
                                              color: AppColors.primaryBrown,
                                              borderRadius: BorderRadius.circular(24),
                                              border: Border.all(color: Colors.white, width: 4),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black.withValues(alpha: isTop ? 0.25 : 0.05),
                                                  blurRadius: isTop ? 25 : 10,
                                                  offset: const Offset(0, 12),
                                                ),
                                              ],
                                            ),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(20),
                                              child: Stack(
                                                fit: StackFit.expand,
                                                children: [
                                                  Image.asset(
                                                    item['image']!,
                                                    fit: BoxFit.cover,
                                                    errorBuilder: (context, error, stackTrace) => Container(
                                                      decoration: const BoxDecoration(
                                                        gradient: LinearGradient(
                                                          colors: [AppColors.deepBrown, Color(0xFF2B1405)],
                                                          begin: Alignment.topLeft,
                                                          end: Alignment.bottomRight,
                                                        ),
                                                      ),
                                                      child: const Center(
                                                        child: Icon(Icons.temple_hindu, size: 90, color: AppColors.warmGold),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      gradient: LinearGradient(
                                                        colors: [Colors.transparent, Colors.black.withValues(alpha: 0.85)],
                                                        begin: Alignment.topCenter,
                                                        end: Alignment.bottomCenter,
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    top: 16,
                                                    right: 16,
                                                    child: Container(
                                                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius: BorderRadius.circular(20),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.black.withValues(alpha: 0.15),
                                                            blurRadius: 8,
                                                          ),
                                                        ],
                                                      ),
                                                      child: const Row(
                                                        mainAxisSize: MainAxisSize.min,
                                                        children: [
                                                          Text(
                                                            'ॐ',
                                                            style: TextStyle(
                                                              fontSize: 13,
                                                              fontWeight: FontWeight.bold,
                                                              color: AppColors.deepBrown,
                                                            ),
                                                          ),
                                                          SizedBox(width: 4),
                                                          Text(
                                                            'POOJAN',
                                                            style: TextStyle(
                                                              fontSize: 10,
                                                              fontWeight: FontWeight.bold,
                                                              letterSpacing: 1,
                                                              color: AppColors.deepBrown,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    bottom: 22,
                                                    left: 22,
                                                    right: 22,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          item['badge']!,
                                                          style: const TextStyle(
                                                            color: AppColors.warmGold,
                                                            fontSize: 11,
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                        ),
                                                        const SizedBox(height: 4),
                                                        Text(
                                                          item['title']!,
                                                          style: GoogleFonts.playfairDisplay(
                                                            color: Colors.white,
                                                            fontSize: 20,
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                        ),
                                                        const SizedBox(height: 4),
                                                        Text(
                                                          item['subtitle']!,
                                                          style: TextStyle(
                                                            color: Colors.white.withValues(alpha: 0.85),
                                                            fontSize: 12,
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
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            ),
                          ),
                          // Left Navigation Arrow
                          Positioned(
                            left: 0,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 20,
                              child: IconButton(
                                icon: const Icon(Icons.chevron_left, color: AppColors.deepBrown),
                                onPressed: _prevCard,
                              ),
                            ),
                          ),
                          // Right Navigation Arrow
                          Positioned(
                            right: 0,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 20,
                              child: IconButton(
                                icon: const Icon(Icons.chevron_right, color: AppColors.deepBrown),
                                onPressed: _nextCard,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Bottom Pagination Dots
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(_poojasList.length, (dotIndex) {
                        bool isDotActive = (_currentIndex == dotIndex);
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          height: 8,
                          width: isDotActive ? 24 : 8,
                          decoration: BoxDecoration(
                            color: isDotActive ? AppColors.warmGold : AppColors.warmGold.withValues(alpha: 0.3),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
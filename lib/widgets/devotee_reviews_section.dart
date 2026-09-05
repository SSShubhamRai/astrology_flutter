import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart'; // Centralized AppColors import kiya gaya hai

class DevoteeReviewsSection extends StatefulWidget {
  const DevoteeReviewsSection({super.key});

  @override
  State<DevoteeReviewsSection> createState() => _DevoteeReviewsSectionState();
}

class _DevoteeReviewsSectionState extends State<DevoteeReviewsSection> {
  late final ScrollController _scrollController;
  Timer? _autoScrollTimer;

  final List<Map<String, String>> _reviews = [
    {
      'name': 'Anil Sharma',
      'location': 'Mumbai',
      'initial': 'A',
      'comment': 'The booking was simple, and the puja updates were shared clearly.',
    },
    {
      'name': 'Priya Mehta',
      'location': 'Delhi',
      'initial': 'P',
      'comment': 'The pandit performed the sankalp with our family names exactly as shared.',
    },
    {
      'name': 'Rahul Verma',
      'location': 'Bengaluru',
      'initial': 'R',
      'comment': 'We received timely photos and felt connected even while attending online.',
    },
    {
      'name': 'Sunita Joshi',
      'location': 'Pune',
      'initial': 'S',
      'comment': 'An authentic temple experience right from home. Highly satisfied with the services.',
    },
    {
      'name': 'Vikramaditya Roy',
      'location': 'Kolkata',
      'initial': 'V',
      'comment': 'The guidance and prasad delivery were handled with utmost devotion and care.',
    },
  ];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _autoScrollTimer = Timer.periodic(const Duration(milliseconds: 30), (timer) {
      if (_scrollController.hasClients) {
        double maxScroll = _scrollController.position.maxScrollExtent;
        double currentScroll = _scrollController.offset;
        
        if (currentScroll >= maxScroll) {
          _scrollController.jumpTo(0);
        } else {
          _scrollController.jumpTo(currentScroll + 4);
        }
      }
    });
  }

  @override
  void dispose() {
    _autoScrollTimer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Infinite loop effect ke liye list ko duplicate kiya gaya hai
    final extendedReviews = [..._reviews, ..._reviews, ..._reviews];

    return Container(
      width: double.infinity,
      color: AppColors.creamBg, // Centralized cream background tone
      padding: const EdgeInsets.symmetric(vertical: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'FROM OUR DEVOTEES',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
              color: Color(0xFFE76F51),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "What they're saying?",
            style: GoogleFonts.playfairDisplay(
              fontSize: 34,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryBrown,
            ),
          ),
          const SizedBox(height: 40),

          // Continuous Auto-Scrolling Reviews Row
          SizedBox(
            height: 220,
            child: MouseRegion(
              onEnter: (_) => _autoScrollTimer?.cancel(),
              onExit: (_) => _startAutoScroll(),
              child: ListView.builder(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: extendedReviews.length,
                itemBuilder: (context, index) {
                  final review = extendedReviews[index];
                  return Container(
                    width: 360,
                    margin: const EdgeInsets.symmetric(horizontal: 14),
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: AppColors.borderBrown.withValues(alpha: 0.6)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 15,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // 5 Stars
                            const Row(
                              children: [
                                Icon(Icons.star, color: Colors.amber, size: 18),
                                SizedBox(width: 2),
                                Icon(Icons.star, color: Colors.amber, size: 18),
                                SizedBox(width: 2),
                                Icon(Icons.star, color: Colors.amber, size: 18),
                                SizedBox(width: 2),
                                Icon(Icons.star, color: Colors.amber, size: 18),
                                SizedBox(width: 2),
                                Icon(Icons.star, color: Colors.amber, size: 18),
                              ],
                            ),
                            const SizedBox(height: 14),
                            // Comment
                            Text(
                              '"${review['comment']}"',
                              style: const TextStyle(
                                fontSize: 13.5,
                                color: AppColors.deepBrown,
                                height: 1.5,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ],
                        ),
                        // Devotee Profile Row
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: const Color(0xFFF4E3C1),
                              radius: 20,
                              child: Text(
                                review['initial']!,
                                style: const TextStyle(
                                  color: AppColors.deepBrown,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  review['name']!,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryBrown,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  review['location']!,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: AppColors.subtitleBrown,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart'; // Centralized AppColors import kiya gaya hai

class UserReviewsSection extends StatefulWidget {
  const UserReviewsSection({super.key});

  @override
  State<UserReviewsSection> createState() => _UserReviewsSectionState();
}

class _UserReviewsSectionState extends State<UserReviewsSection> {
  final ScrollController _scrollController = ScrollController();
  Timer? _autoScrollTimer;
  bool _isHovered = false;
  bool _isReviewSelected = false;

  final List<Map<String, dynamic>> _reviews = const [
    {
      'name': 'Kajal',
      'initial': 'K',
      'rating': 5,
      'review': '"Honestly, mujhe laga tha ye bhi ek generic report hogi, lekin ye bahut different tha. The way it explained my personality was amazing."',
    },
    {
      'name': 'Rahul',
      'initial': 'R',
      'rating': 5,
      'review': '"The insights were surprisingly accurate and gave me a much clearer understanding of my career and relationships."',
    },
    {
      'name': 'Priya',
      'initial': 'P',
      'rating': 5,
      'review': '"I finally understood my numbers and the patterns behind many things in my life. Really useful experience."',
    },
    {
      'name': 'Aamit',
      'initial': 'A',
      'rating': 5,
      'review': '"Astrology aur numerology ka ye combination bohot hi unique aur accurate laga mujhe. Highly recommended!"',
    },
    {
      'name': 'Sneha',
      'initial': 'S',
      'rating': 5,
      'review': '"Detailed predictions ne mere future decisions lene mein kaafi help ki. Amazing interface and reports."',
    },
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startContinuousScroll();
    });
  }

  void _startContinuousScroll() {
    _autoScrollTimer = Timer.periodic(const Duration(milliseconds: 25), (timer) {
      if (_scrollController.hasClients && !_isHovered && !_isReviewSelected) {
        final double currentScroll = _scrollController.offset;
        _scrollController.jumpTo(currentScroll + 2.0);
      }
    });
  }

  void _openZoomedReview(Map<String, dynamic> review) {
    setState(() {
      _isReviewSelected = true;
    });

    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'ReviewDialog',
      barrierColor: Colors.black.withValues(alpha: 0.4), // Smooth dark dimming without blink
      transitionDuration: const Duration(milliseconds: 250),
      pageBuilder: (context, animation, secondaryAnimation) {
        return Center(
          child: FadeTransition(
            opacity: animation,
            child: ScaleTransition(
              scale: CurvedAnimation(
                parent: animation,
                curve: Curves.easeOutCubic,
              ),
              child: _ZoomedReviewCard(
                review: review,
                onClose: () => Navigator.of(context).pop(),
              ),
            ),
          ),
        );
      },
    ).then((_) {
      if (mounted) {
        setState(() {
          _isReviewSelected = false;
        });
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
    return Container(
      width: double.infinity,
      color: AppColors.creamBg, // Centralized cream background tone
      padding: const EdgeInsets.symmetric(vertical: 70),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'What Our Users Say',
            style: GoogleFonts.playfairDisplay(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryBrown, // Centralized primary brown color
            ),
          ),
          const SizedBox(height: 40),
          SizedBox(
            height: 240,
            child: MouseRegion(
              onEnter: (_) => setState(() => _isHovered = true),
              onExit: (_) => setState(() => _isHovered = false),
              child: ListView.builder(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 40),
                itemCount: 10000,
                itemBuilder: (context, index) {
                  final review = _reviews[index % _reviews.length];
                  return Padding(
                    padding: const EdgeInsets.only(right: 24),
                    child: _ReviewCard(
                      name: review['name'],
                      initial: review['initial'],
                      rating: review['rating'],
                      reviewText: review['review'],
                      onTap: () => _openZoomedReview(review),
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

class _ReviewCard extends StatelessWidget {
  final String name;
  final String initial;
  final int rating;
  final String reviewText;
  final VoidCallback onTap;

  const _ReviewCard({
    required this.name,
    required this.initial,
    required this.rating,
    required this.reviewText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 360,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.warmGold.withValues(alpha: 0.3)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 15,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: List.generate(
                rating,
                (index) => const Icon(
                  Icons.star_rounded,
                  color: Color(0xFFE5A93B),
                  size: 20,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: Text(
                reviewText,
                style: const TextStyle(
                  color: AppColors.subtitleBrown,
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                  height: 1.4,
                ),
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                CircleAvatar(
                  radius: 18,
                  backgroundColor: AppColors.primaryBrown.withValues(alpha: 0.1),
                  child: Text(
                    initial,
                    style: const TextStyle(
                      color: AppColors.primaryBrown,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        color: AppColors.primaryBrown,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const Text(
                      'Verified User',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ZoomedReviewCard extends StatelessWidget {
  final Map<String, dynamic> review;
  final VoidCallback onClose;

  const _ZoomedReviewCard({
    required this.review,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 450, maxHeight: 320),
        child: Container(
          padding: const EdgeInsets.all(28),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: AppColors.warmGold, width: 1.5),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2),
                blurRadius: 25,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: List.generate(
                      review['rating'],
                      (index) => const Icon(
                        Icons.star_rounded,
                        color: Color(0xFFE5A93B),
                        size: 22,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.grey),
                    onPressed: onClose,
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    review['review'],
                    style: const TextStyle(
                      color: AppColors.primaryBrown,
                      fontSize: 17,
                      fontStyle: FontStyle.italic,
                      height: 1.5,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: AppColors.primaryBrown.withValues(alpha: 0.1),
                    child: Text(
                      review['initial'],
                      style: const TextStyle(
                        color: AppColors.primaryBrown,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        review['name'],
                        style: const TextStyle(
                          color: AppColors.primaryBrown,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      const Text(
                        'Verified User',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../theme/app_colors.dart'; // Centralized AppColors import kiya gaya hai

class InsightsVideoSection extends StatefulWidget {
  const InsightsVideoSection({super.key});

  @override
  State<InsightsVideoSection> createState() => _InsightsVideoSectionState();
}

class _InsightsVideoSectionState extends State<InsightsVideoSection> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/homevideo.mp4')
      ..initialize().then((_) {
        _controller.play();
        _controller.setLooping(true);
        _controller.setVolume(0.0); // Muted background video
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.creamBg, // Centralized cream background tone
      padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 40),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 60,
            runSpacing: 40,
            children: [
              // Left Side: Video Player with Rounded Corners & Floating Chip
              Container(
                width: 380,
                height: 480,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.12),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      _controller.value.isInitialized
                          ? FittedBox(
                              fit: BoxFit.cover,
                              child: SizedBox(
                                width: _controller.value.size.width,
                                height: _controller.value.size.height,
                                child: VideoPlayer(_controller),
                              ),
                            )
                          : Container(color: AppColors.primaryBrown.withValues(alpha: 0.2)),
                      
                      // Bottom Floating Chip inside video ("Discover Your Numbers")
                      Positioned(
                        bottom: 20,
                        left: 20,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.9),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.auto_awesome, size: 16, color: AppColors.primaryBrown),
                              SizedBox(width: 8),
                              Text(
                                'Discover Your Numbers',
                                style: TextStyle(
                                  color: AppColors.primaryBrown,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Right Side: Content & Bullet Points
              SizedBox(
                width: 600,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'PERSONALIZED INSIGHTS',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        color: AppColors.warmGold, // Centralized warm gold color
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'What Your Numbers\nReveal About You',
                      style: TextStyle(
                        fontFamily: 'serif',
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryBrown, // Centralized primary brown color
                        height: 1.15,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Discover meaningful insights about your personality, relationships, career and life purpose through your personalized numerology report.',
                      style: TextStyle(
                        fontSize: 15,
                        color: AppColors.subtitleBrown, // Centralized subtitle tone
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 28),

                    // Feature Check List (Removed 'const' keyword before children list to fix runtime parameter error)
                    Column(
                      children: const [
                        _CheckListItem(text: 'Personality & Core Strengths'),
                        SizedBox(height: 12),
                        _CheckListItem(text: 'Love, Marriage & Relationships'),
                        SizedBox(height: 12),
                        _CheckListItem(text: 'Career & Financial Guidance'),
                        SizedBox(height: 12),
                        _CheckListItem(text: 'Personalized Insights & Remedies'),
                      ],
                    ),
                    const SizedBox(height: 36),

                    // CTA Button
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        side: BorderSide(color: AppColors.primaryBrown.withValues(alpha: 0.3), width: 1.5),
                        backgroundColor: AppColors.creamBg,
                      ),
                      onPressed: () {},
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Unlock Your Full Report',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryBrown,
                            ),
                          ),
                          SizedBox(width: 10),
                          Icon(Icons.arrow_forward, size: 18, color: AppColors.primaryBrown),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Helper widget for check list rows
class _CheckListItem extends StatelessWidget {
  final String text;
  const _CheckListItem({required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: AppColors.warmGold.withValues(alpha: 0.15),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.check, size: 16, color: AppColors.warmGold),
        ),
        const SizedBox(width: 14),
        Text(
          text,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: AppColors.primaryBrown,
          ),
        ),
      ],
    );
  }
}
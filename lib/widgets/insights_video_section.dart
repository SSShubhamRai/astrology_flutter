import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

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
    // Aap yahan apni section ki koi bhi video file laga sakte hain
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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      width: double.infinity,
      color: theme.scaffoldBackgroundColor,
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
                          : Container(color: colorScheme.primary.withValues(alpha: 0.2)),
                      
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
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.auto_awesome, size: 16, color: colorScheme.primary),
                              const SizedBox(width: 8),
                              Text(
                                'Discover Your Numbers',
                                style: TextStyle(
                                  color: colorScheme.primary,
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
                    Text(
                      'PERSONALIZED INSIGHTS',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        color: colorScheme.secondary,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'What Your Numbers\nReveal About You',
                      style: TextStyle(
                        fontFamily: 'serif',
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                        color: colorScheme.primary,
                        height: 1.15,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Discover meaningful insights about your personality, relationships, career and life purpose through your personalized numerology report.',
                      style: TextStyle(
                        fontSize: 15,
                        color: colorScheme.onSurface.withValues(alpha: 0.75),
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 28),

                    // Feature Check List
                    const Column(
                      children: [
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
                        side: BorderSide(color: colorScheme.primary.withValues(alpha: 0.3), width: 1.5),
                        backgroundColor: const Color(0xFFFDFBF7),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Unlock Your Full Report',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: colorScheme.primary,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Icon(Icons.arrow_forward, size: 18, color: colorScheme.primary),
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
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: colorScheme.secondary.withValues(alpha: 0.15),
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.check, size: 16, color: colorScheme.secondary),
        ),
        const SizedBox(width: 14),
        Text(
          text,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: colorScheme.primary,
          ),
        ),
      ],
    );
  }
}
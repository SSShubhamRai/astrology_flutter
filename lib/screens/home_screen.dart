import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';
import '../widgets/custom_navbar.dart';
import '../widgets/expert_report_section.dart';
import '../widgets/premium_report_section.dart';
import '../widgets/insights_video_section.dart';
import '../widgets/spotlight_videos_section.dart';
import '../widgets/user_reviews_section.dart';
import '../widgets/faq_section.dart';
import '../widgets/app_footer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late VideoPlayerController _controller;
  bool _isMuted = true;
  String? _videoError;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/homevideo.mp4');
    _initializeVideo();
  }

  Future<void> _initializeVideo() async {
    try {
      await _controller.initialize();
      await _controller.setLooping(true);
      await _controller.setVolume(0.0);
      await _controller.play();

      if (mounted) setState(() {});
    } catch (error) {
      debugPrint('Video initialization error: $error');
      if (mounted) setState(() => _videoError = error.toString());
    }
  }

  Future<void> _toggleAudio() async {
    if (!_controller.value.isInitialized) return;

    final isMuted = !_isMuted;
    await _controller.setVolume(isMuted ? 0.0 : 1.0);
    if (mounted) setState(() => _isMuted = isMuted);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scaffoldBgColor = Theme.of(context).scaffoldBackgroundColor;

    return Scaffold(
      body: Stack(
        children: [
          // Main Scrollable Page Content
          SingleChildScrollView(
            child: Column(
              children: [
                // 1. HERO SECTION
                SizedBox(
                  width: double.infinity,
                  child: Stack(
                    children: [
                      // Background Video Player restricted to Hero Section
                      Positioned.fill(
                        child: _controller.value.isInitialized
                            ? FittedBox(
                                fit: BoxFit.cover,
                                child: SizedBox(
                                  width: _controller.value.size.width,
                                  height: _controller.value.size.height,
                                  child: IgnorePointer(child: VideoPlayer(_controller)),
                                ),
                              )
                            : ColoredBox(
                                color: const Color(0xFF5B2C0E),
                                child: _videoError == null
                                    ? const Center(child: CircularProgressIndicator(color: Colors.white))
                                    : Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(24),
                                          child: Text(
                                            'Unable to load background video:\n$_videoError',
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                              ),
                      ),

                      // Semi-transparent overlay for the Hero Section
                      Positioned.fill(
                        child: Container(
                          color: const Color(0xFF5B2C0E).withValues(alpha: 0.45),
                        ),
                      ),

                      // Hero Content
                      Column(
                        children: [
                          const SizedBox(height: 110), // Navbar space
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Column(
                              children: [
                                Text(
                                  'Discover the Secrets\nHidden in Your Numbers',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.playfairDisplay(
                                    fontSize: 48,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    height: 1.15,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                const Text(
                                  'Unlock personalised numerology insights about your personality, career,\nrelationships and life path.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFFE6CCB2),
                                    height: 1.5,
                                  ),
                                ),
                                const SizedBox(height: 40),

                                // CTA Button
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFFFDFBF7),
                                    foregroundColor: const Color(0xFF5B2C0E),
                                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    elevation: 4,
                                  ),
                                  onPressed: () {},
                                  child: const Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Get Your Numerology Report',
                                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(width: 10),
                                      Icon(Icons.arrow_forward, size: 18),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 50),

                                // Social Proof
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        _buildAvatarCircle('A', const Color(0xFFD4A373), 0),
                                        _buildAvatarCircle('R', const Color(0xFF9C4A1A), -12),
                                        _buildAvatarCircle('S', const Color(0xFF5B2C0E), -24),
                                        _buildAvatarCircle('+', Colors.teal, -36),
                                      ],
                                    ),
                                    const SizedBox(width: 16),
                                    const Text(
                                      '50K+ Happy Users',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 50),

                          // Centered Feature Cards Section inside Hero
                          Center(
                            child: LayoutBuilder(
                              builder: (context, constraints) {
                                final cardGap = 20.0;
                                final totalGap = cardGap * 4;
                                final availableWidth = constraints.maxWidth - 40.0 - totalGap;
                                final cardWidth = (availableWidth / 5).clamp(140.0, 180.0);

                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    _buildFeatureCard(
                                      icon: Icons.auto_awesome,
                                      title: 'Life Path Insights',
                                      subtitle: 'Explore now →',
                                      width: cardWidth,
                                    ),
                                    const SizedBox(width: 20),
                                    _buildFeatureCard(
                                      icon: Icons.stars,
                                      title: 'Personalized Insights',
                                      subtitle: 'Explore now →',
                                      width: cardWidth,
                                    ),
                                    const SizedBox(width: 20),
                                    _buildFeatureCard(
                                      icon: Icons.diamond_outlined,
                                      title: 'Lucky Numbers',
                                      subtitle: 'Explore now →',
                                      width: cardWidth,
                                    ),
                                    const SizedBox(width: 20),
                                    _buildFeatureCard(
                                      icon: Icons.favorite_border,
                                      title: 'Love & Compatibility',
                                      subtitle: 'Explore now →',
                                      width: cardWidth,
                                    ),
                                    const SizedBox(width: 20),
                                    _buildFeatureCard(
                                      icon: Icons.trending_up,
                                      title: 'Career & Finance',
                                      subtitle: 'Explore now →',
                                      width: cardWidth,
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 60),
                        ],
                      ),
                    ],
                  ),
                ),

                // 2. REST OF THE SECTIONS
                Container(
                  color: scaffoldBgColor,
                  child: const Column(
                    children: [
                      ExpertReportSection(),
                      PremiumReportSection(),
                      InsightsVideoSection(),
                      SpotlightVideosSection(),
                      UserReviewsSection(),
                      FaqSection(),
                      AppFooter(),
                      
                    ],
                  ),
                ),
              ],
            ),
          ),

          // FIXED / STICKY NAVBAR AT THE TOP
          const Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: CustomNavbar(),
          ),

          // Floating Sound Control Button at bottom-right corner
          Positioned(
            bottom: 24,
            right: 24,
            child: FloatingActionButton(
              backgroundColor: const Color(0xFFFDFBF7),
              foregroundColor: const Color(0xFF5B2C0E),
              onPressed: _toggleAudio,
              child: Icon(_isMuted ? Icons.volume_off : Icons.volume_up),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAvatarCircle(String text, Color color, double leftOffset) {
    return Transform.translate(
      offset: Offset(leftOffset, 0),
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(color: const Color(0xFFFDFBF7), width: 2),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    required String subtitle,
    double? width,
  }) {
    return Container(
      width: width ?? 220,
      height: 90,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFDFBF7),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFF5B2C0E).withValues(alpha: 0.08),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: const Color(0xFF5B2C0E), size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF5B2C0E),
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Color(0xFFD4A373),
                    fontWeight: FontWeight.w600,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
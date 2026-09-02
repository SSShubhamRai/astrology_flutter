import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class WhyChooseUsSection extends StatefulWidget {
  const WhyChooseUsSection({super.key});

  @override
  State<WhyChooseUsSection> createState() => _WhyChooseUsSectionState();
}

class _WhyChooseUsSectionState extends State<WhyChooseUsSection> {
  late final YoutubePlayerController _controller;
  int _selectedIndex = 1; // By default 1st index (Personalized Guidance) selected hai, aap ise 0 ya -1 bhi kar sakte hain

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController.fromVideoId(
      videoId: '-yj72m_k2Zw',
      autoPlay: false,
      params: const YoutubePlayerParams(
        showControls: true,
        showFullscreenButton: true,
        strictRelatedVideos: true,
      ),
    );
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFFFDFBF7),
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 80),
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 950) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 6,
                  child: _buildVideoCardWrapper(),
                ),
                const SizedBox(width: 40),
                Expanded(
                  flex: 6,
                  child: _buildRightContent(),
                ),
              ],
            );
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: _buildVideoCardWrapper()),
                const SizedBox(height: 50),
                _buildRightContent(),
              ],
            );
          }
        },
      ),
    );
  }

  Widget _buildVideoCardWrapper() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFD4A373).withValues(alpha: 0.4), width: 1.2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: YoutubePlayer(
          controller: _controller,
          aspectRatio: 16 / 9,
        ),
      ),
    );
  }

  Widget _buildRightContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFD4A373).withValues(alpha: 0.6)),
            borderRadius: BorderRadius.circular(20),
            color: const Color(0xFF5B2C0E).withValues(alpha: 0.05),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.auto_awesome, color: Color(0xFF5B2C0E), size: 14),
              SizedBox(width: 8),
              Text(
                'WHY CHOOSE US',
                style: TextStyle(
                  color: Color(0xFF5B2C0E),
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Why Choose Our Experts?',
          style: GoogleFonts.playfairDisplay(
            fontSize: 42,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF5B2C0E),
            height: 1.2,
          ),
        ),
        const SizedBox(height: 14),
        const Text(
          'Get thoughtful guidance, personalized insights, and practical direction for the questions that matter most to you.',
          style: TextStyle(
            fontSize: 15,
            color: Color(0xFF7F4F24),
            height: 1.5,
          ),
        ),
        const SizedBox(height: 30),

        // Interactive Feature Cards List
        _buildFeatureItem(
          index: 0,
          icon: Icons.verified_user_outlined,
          title: 'Experienced Experts',
          description: 'Get guidance from experienced practitioners who understand your unique concerns.',
        ),
        const SizedBox(height: 16),
        _buildFeatureItem(
          index: 1,
          icon: Icons.psychology_outlined,
          title: 'Personalized Guidance',
          description: 'Every consultation is focused on your questions, circumstances, and goals.',
        ),
        const SizedBox(height: 16),
        _buildFeatureItem(
          index: 2,
          icon: Icons.lightbulb_outline_rounded,
          title: 'Practical Solutions',
          description: 'Receive clear insights, actionable guidance, and personalized recommendations.',
        ),
        const SizedBox(height: 36),

        Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFFE9C46A), Color(0xFFD4A373)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFD4A373).withValues(alpha: 0.4),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              foregroundColor: const Color(0xFF5B2C0E),
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
                  'Schedule a Call',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 8),
                Icon(Icons.arrow_forward, size: 16),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Feature Card with Hover / Tap interactivity
  Widget _buildFeatureItem({
    required int index,
    required IconData icon,
    required String title,
    required String description,
  }) {
    final bool isSelected = _selectedIndex == index;

    return MouseRegion(
      onEnter: (_) => setState(() => _selectedIndex = index), // Mouse hover karne par card highlight hoga
      child: GestureDetector(
        onTap: () => setState(() => _selectedIndex = index), // Tap karne par bhi highlight hoga
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isSelected ? const Color(0xFFD4A373) : Colors.grey.withValues(alpha: 0.2),
              width: isSelected ? 1.5 : 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: isSelected ? 0.06 : 0.02),
                blurRadius: isSelected ? 12 : 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: isSelected
                      ? const Color(0xFF5B2C0E)
                      : const Color(0xFF5B2C0E).withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  color: isSelected ? Colors.white : const Color(0xFF5B2C0E),
                  size: 24,
                ),
              ),
              const SizedBox(width: 18),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF5B2C0E),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 13.5,
                        color: Colors.grey[700],
                        height: 1.4,
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
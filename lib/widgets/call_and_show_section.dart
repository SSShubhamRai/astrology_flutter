import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'dart:ui';
import '../theme/app_colors.dart';

class CallAndShowSection extends StatelessWidget {
  const CallAndShowSection({super.key});

  void _openVideoDialog(BuildContext context, String videoId, String title) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'VideoDialog',
      barrierColor: Colors.black.withValues(alpha: 0.6),
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: Center(
            child: _VideoPlayerDialog(
              videoId: videoId,
              title: title,
              onClose: () => Navigator.of(context).pop(),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.creamBg,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: LayoutBuilder(
            builder: (context, constraints) {
              bool isWide = constraints.maxWidth > 850;

              final card1 = _buildPromoCard(
                context,
                title: 'Call Consultation',
                description: 'Talk to Astrologer Shubham Ji for practical solutions and transformative insights that foster harmony, clarity, balance, and personal growth.',
                actionText: 'Schedule a call',
                imagePath: 'assets/images/shubham .jpg',
                onTap: () {},
                isVideo: false,
              );

              final card2 = _buildPromoCard(
                context,
                title: 'The Shubham Show',
                description: 'Listen to powerful conversations on Vedic wisdom and discover lessons to enrich your life.',
                actionText: 'Watch now',
                imagePath: '', // YouTube Thumbnail will be fetched automatically via videoId
                videoId: '-yj72m_k2Zw',
                onTap: () => _openVideoDialog(context, '-yj72m_k2Zw', 'The Shubham Show'),
                isVideo: true,
              );

              if (isWide) {
                return Row(
                  children: [
                    Expanded(child: card1),
                    const SizedBox(width: 30),
                    Expanded(child: card2),
                  ],
                );
              } else {
                return Column(
                  children: [
                    card1,
                    const SizedBox(height: 30),
                    card2,
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildPromoCard(
    BuildContext context, {
    required String title,
    required String description,
    required String actionText,
    required String imagePath,
    required VoidCallback onTap,
    required bool isVideo,
    String videoId = '',
  }) {
    final String youtubeThumbnail = 'https://img.youtube.com/vi/$videoId/hqdefault.jpg';

    return Container(
      height: 280,
      decoration: BoxDecoration(
        color: const Color(0xFFC67D34), // Rich deep warm brown/orange matching reference theme
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.warmGold.withValues(alpha: 0.4), width: 1.2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            // Right Side Image / Video Thumbnail Background Integration
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              width: 220,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  isVideo
                      ? Image.network(
                          youtubeThumbnail,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => Container(color: AppColors.primaryBrown),
                        )
                      : Image.asset(
                          imagePath,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => Container(color: AppColors.primaryBrown),
                        ),
                  // Subtle gradient overlay to merge image smoothly with the box card background
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          const Color(0xFFC67D34),
                          const Color(0xFFC67D34).withValues(alpha: 0.1),
                        ],
                      ),
                    ),
                  ),
                  if (isVideo)
                    const Center(
                      child: Icon(
                        Icons.play_circle_fill_rounded,
                        size: 50,
                        color: Colors.white,
                      ),
                    ),
                ],
              ),
            ),

            // Left Side Content Padding
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: SizedBox(
                width: 280,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          description,
                          style: TextStyle(
                            fontSize: 12.5,
                            color: Colors.white.withValues(alpha: 0.9),
                            height: 1.45,
                          ),
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: onTap,
                      borderRadius: BorderRadius.circular(8),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            actionText,
                            style: const TextStyle(
                              fontSize: 13.5,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 6),
                          const Icon(Icons.arrow_forward, size: 14, color: Colors.white),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// In-App Video Dialog for "Watch now" click
class _VideoPlayerDialog extends StatefulWidget {
  final String videoId;
  final String title;
  final VoidCallback onClose;

  const _VideoPlayerDialog({
    required this.videoId,
    required this.title,
    required this.onClose,
  });

  @override
  State<_VideoPlayerDialog> createState() => _VideoPlayerDialogState();
}

class _VideoPlayerDialogState extends State<_VideoPlayerDialog> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController.fromVideoId(
      videoId: widget.videoId,
      autoPlay: true,
      params: const YoutubePlayerParams(
        showControls: true,
        showFullscreenButton: true,
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
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 800, maxHeight: 520),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primaryBrown,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.warmGold, width: 1.5),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: widget.onClose,
                  ),
                ],
              ),
            ),
            Expanded(
              child: YoutubePlayer(controller: _controller),
            ),
          ],
        ),
      ),
    );
  }
}
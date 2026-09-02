import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:url_launcher/url_launcher.dart';

class SpotlightVideosSection extends StatefulWidget {
  const SpotlightVideosSection({super.key});

  @override
  State<SpotlightVideosSection> createState() => _SpotlightVideosSectionState();
}

class _SpotlightVideosSectionState extends State<SpotlightVideosSection> {
  final ScrollController _scrollController = ScrollController();
  Timer? _autoScrollTimer;
  bool _isHovered = false;
  bool _isVideoPlaying = false;
  String _selectedCategory = 'ALL'; // Filter state

  final List<Map<String, String>> _allVideos = const [
    {
      'id': 'Id6cjZGSK_8',
      'title': 'Mahabharat Astrology Decoded',
      'category': 'LIFE INSIGHTS',
    },
    {
      'id': 'ohBom_rmGtg',
      'title': 'Garud Puran Secrets',
      'category': 'CORE NUMBERS',
    },
    {
      'id': '9rRCeyT9pGw',
      'title': 'Indresh Ji Maharaj',
      'category': 'FINANCE',
    },
    {
      'id': 'V_c7wU2njME',
      'title': 'सावन सोमवार का असली सच',
      'category': 'RELATIONSHIPS',
    },
    {
      'id': '6QNYhF9nrJs',
      'title': 'Shani Dev',
      'category': 'ADVANCED',
    },
  ];

  List<Map<String, String>> get _filteredVideos {
    if (_selectedCategory == 'ALL') {
      return _allVideos;
    }
    return _allVideos.where((v) => v['category'] == _selectedCategory).toList();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startContinuousScroll();
    });
  }

  void _startContinuousScroll() {
    _autoScrollTimer = Timer.periodic(const Duration(milliseconds: 25), (timer) {
      if (_scrollController.hasClients && !_isHovered && !_isVideoPlaying && _selectedCategory == 'ALL') {
        double currentScroll = _scrollController.offset;
        _scrollController.jumpTo(currentScroll + 2.5);
      }
    });
  }

  void _openVideoDialog(String videoId, String title) {
    setState(() {
      _isVideoPlaying = true;
    });

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
              onClose: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        );
      },
    ).then((_) {
      setState(() {
        _isVideoPlaying = false;
      });
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
    final colorScheme = Theme.of(context).colorScheme;
    final categories = ['ALL', 'LIFE INSIGHTS', 'CORE NUMBERS', 'FINANCE', 'RELATIONSHIPS', 'ADVANCED'];

    return Container(
      width: double.infinity,
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: const EdgeInsets.symmetric(vertical: 70),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'EXPLORE & DISCOVER',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.8,
              color: colorScheme.secondary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'In the Spotlight',
            style: TextStyle(
              fontFamily: 'serif',
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: colorScheme.primary,
            ),
          ),
          const SizedBox(height: 24),

          // Category Filter Buttons Bar
          Wrap(
            spacing: 12,
            runSpacing: 8,
            alignment: WrapAlignment.center,
            children: categories.map((cat) {
              final isSelected = _selectedCategory == cat;
              return ChoiceChip(
                label: Text(cat),
                selected: isSelected,
                onSelected: (selected) {
                  setState(() {
                    _selectedCategory = cat;
                  });
                },
                selectedColor: colorScheme.primary,
                backgroundColor: Colors.white,
                labelStyle: TextStyle(
                  color: isSelected ? Colors.white : colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(color: colorScheme.primary.withValues(alpha: 0.3)),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 36),

          // Videos List (Infinite Marquee if 'ALL', else static horizontal scroll for filtered items)
          SizedBox(
            height: 280,
            child: MouseRegion(
              onEnter: (_) => setState(() => _isHovered = true),
              onExit: (_) => setState(() => _isHovered = false),
              child: ListView.builder(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 40),
                itemCount: _selectedCategory == 'ALL' ? 10000 : _filteredVideos.length,
                itemBuilder: (context, index) {
                  final videosList = _filteredVideos;
                  final video = videosList[index % videosList.length];
                  return Padding(
                    padding: const EdgeInsets.only(right: 24),
                    child: _SpotlightCard(
                      title: video['title']!,
                      category: video['category']!,
                      videoId: video['id']!,
                      onTap: () => _openVideoDialog(video['id']!, video['title']!),
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

// Individual Spotlight Card Widget
class _SpotlightCard extends StatelessWidget {
  final String title;
  final String category;
  final String videoId;
  final VoidCallback onTap;

  const _SpotlightCard({
    required this.title,
    required this.category,
    required this.videoId,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final thumbnailUrl = 'https://img.youtube.com/vi/$videoId/maxresdefault.jpg';

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 380,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                thumbnailUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.network(
                    'https://img.youtube.com/vi/$videoId/hqdefault.jpg',
                    fit: BoxFit.cover,
                  );
                },
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withValues(alpha: 0.75),
                    ],
                  ),
                ),
              ),
              const Center(
                child: Icon(
                  Icons.play_circle_fill_rounded,
                  size: 64,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        category,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
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

// In-App Video Player Dialog Component with "Watch on YouTube" option
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
        mute: false,
      ),
    );
  }

  Future<void> _launchYouTube() async {
    final Uri url = Uri.parse('https://www.youtube.com/watch?v=${widget.videoId}');
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
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
          color: const Color(0xFF1E1E1E),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.5),
              blurRadius: 30,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      widget.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Row(
                    children: [
                      // Watch on YouTube direct button
                      IconButton(
                        icon: const Icon(Icons.open_in_new, color: Colors.white70, size: 20),
                        tooltip: 'Watch on YouTube',
                        onPressed: _launchYouTube,
                      ),
                      IconButton(
                        icon: const Icon(Icons.close, color: Colors.white),
                        onPressed: widget.onClose,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: YoutubePlayer(
                controller: _controller,
                aspectRatio: 16 / 9,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
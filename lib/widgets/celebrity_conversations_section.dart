import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';

class CelebrityConversationsSection extends StatefulWidget {
  const CelebrityConversationsSection({super.key});

  @override
  State<CelebrityConversationsSection> createState() => _CelebrityConversationsSectionState();
}

class _CelebrityConversationsSectionState extends State<CelebrityConversationsSection> {
  int _currentIndex = 0;
  Timer? _timer;

  final List<Map<String, String>> _celebrities = [
    {
      'name': 'Virat Kohli',
      'role': 'Cricketer',
      'review': 'What I appreciated most was how comfortable the session felt. The conversation flowed naturally without feeling forced. Shubham ji explains things with a lot of clarity and patience. I could relate to several points during the discussion. It gave me a fresh and clearer perspective. A good experience I must say.',
      'image': 'assets/images/ViratKohli.jpg',
    },
    {
      'name': 'Samay Raina',
      'role': 'Comedian',
      'review': 'An extraordinary experience! The depth of knowledge and the precision of insights completely blew my mind. It gave me the exact clarity I was seeking for my future decisions. Truly a transformative session.',
      'image': 'assets/images/SamayRaina.webp',
    },
    {
      'name': 'Pankaj Tripathi',
      'role': 'Actor',
      'review': 'I was amazed by how accurately everything resonated with my current life phase. The guidance provided was practical, calming, and deeply intuitive. Highly recommend connecting with Shubham ji!',
      'image': 'assets/images/PankajTripathi.jpg',
    },
  ];

  @override
  void initState() {
    super.initState();
    _startAutoPlay();
  }

  void _startAutoPlay() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (mounted) {
        setState(() {
          _currentIndex = (_currentIndex + 1) % _celebrities.length;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _onThumbnailTap(int index) {
    _timer?.cancel();
    setState(() {
      _currentIndex = index;
    });
    _startAutoPlay();
  }

  @override
  Widget build(BuildContext context) {
    final currentCeleb = _celebrities[_currentIndex];

    return Container(
      width: double.infinity,
      // Unique deep rich royal gradient background styling distinct from standard section blocks
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF3D1C06), Color(0xFF5B2C0E), Color(0xFF7F4F24)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 70),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: LayoutBuilder(
            builder: (context, constraints) {
              bool isWide = constraints.maxWidth > 850;

              final leftContent = Expanded(
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Section Title
                    Text(
                      'In Conversation\nWith Celebrities',
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        height: 1.15,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Animated Review Text with Fade/Switch effect
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 600),
                      child: Text(
                        currentCeleb['review']!,
                        key: ValueKey<int>(_currentIndex),
                        style: TextStyle(
                          fontSize: 15.5,
                          color: Colors.white.withValues(alpha: 0.9),
                          height: 1.6,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Name & Role
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 600),
                      child: Column(
                        key: ValueKey<String>('name_${_currentIndex}'),
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            currentCeleb['name']!,
                            style: GoogleFonts.playfairDisplay(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.lightGold,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            currentCeleb['role']!,
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.white.withValues(alpha: 0.7),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 35),

                    // Thumbnail Selector Row
                    Row(
                      children: List.generate(_celebrities.length, (index) {
                        bool isSelected = _currentIndex == index;
                        return GestureDetector(
                          onTap: () => _onThumbnailTap(index),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.only(right: 14),
                            padding: EdgeInsets.all(isSelected ? 3 : 0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: isSelected ? AppColors.warmGold : Colors.transparent,
                                width: 2.5,
                              ),
                            ),
                            child: CircleAvatar(
                              radius: isSelected ? 24 : 20,
                              backgroundColor: AppColors.primaryBrown,
                              child: ClipOval(
                                child: Image.asset(
                                  _celebrities[index]['image']!,
                                  fit: BoxFit.cover,
                                  width: isSelected ? 48 : 40,
                                  height: isSelected ? 48 : 40,
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Icon(Icons.person, color: Colors.white70, size: 22);
                                  },
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              );

              final rightImage = Expanded(
                flex: 5,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: 420,
                    alignment: Alignment.bottomCenter,
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 600),
                      transitionBuilder: (Widget child, Animation<double> animation) {
                        return FadeTransition(opacity: animation, child: child);
                      },
                      child: ClipRRect(
                        key: ValueKey<int>(_currentIndex),
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          currentCeleb['image']!,
                          fit: BoxFit.cover,
                          width: 350,
                          height: 400,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              width: 300,
                              height: 380,
                              decoration: BoxDecoration(
                                color: AppColors.primaryBrown.withValues(alpha: 0.5),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: const Center(
                                child: Icon(Icons.person, size: 100, color: Colors.white54),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              );

              if (isWide) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    leftContent,
                    const SizedBox(width: 40),
                    rightImage,
                  ],
                );
              } else {
                return Column(
                  children: [
                    leftContent,
                    const SizedBox(height: 40),
                    rightImage,
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
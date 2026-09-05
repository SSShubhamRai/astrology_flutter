import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart'; // Centralized AppColors import kiya gaya hai

class ReportsGridSection extends StatefulWidget {
  const ReportsGridSection({super.key});

  @override
  State<ReportsGridSection> createState() => _ReportsGridSectionState();
}

class _ReportsGridSectionState extends State<ReportsGridSection> {
  int? _selectedCardIndex;
  final List<GlobalKey> _cardKeys = [];

  final List<Map<String, String>> _reportsData = [
    {
      'tag': 'ASTROLOGY',
      'number': '01',
      'title': 'Personalized Kundli',
      'desc': 'Understand your personality, planetary influences, strengths and major life patterns.',
    },
    {
      'tag': 'CAREER',
      'number': '02',
      'title': 'Career & Business',
      'desc': 'Discover your professional strengths, opportunities and the periods that matter.',
    },
    {
      'tag': 'RELATIONSHIP',
      'number': '03',
      'title': 'Marriage & Love',
      'desc': 'Explore compatibility, relationship patterns and meaningful connections.',
    },
  ];

  @override
  void initState() {
    super.initState();
    // Har card ke liye unique GlobalKey generate karte hain taaki scroll position track ho sake
    for (int i = 0; i < _reportsData.length; i++) {
      _cardKeys.add(GlobalKey());
    }
  }

  void _scrollToCard(int index) {
    final contextKey = _cardKeys[index].currentContext;
    if (contextKey != null) {
      Scrollable.ensureVisible(
        contextKey,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOutCubic,
        alignment: 0.5, // 0.5 ka matlab card screen ke bilkul CENTER mein aayega!
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.creamBg, // Centralized cream background tone
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Top Badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.warmGold.withValues(alpha: 0.6)),
              borderRadius: BorderRadius.circular(20),
              color: AppColors.deepBrown.withValues(alpha: 0.05),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.auto_awesome, color: AppColors.deepBrown, size: 14),
                SizedBox(width: 8),
                Text(
                  'EXPLORE REPORTS',
                  style: TextStyle(
                    color: AppColors.deepBrown,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Main Heading
          Text(
            "Guidance For Every Area Of Life",
            textAlign: TextAlign.center,
            style: GoogleFonts.playfairDisplay(
              fontSize: 44,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryBrown,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Choose a personalized report and discover insights that can help you make better decisions.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15, color: AppColors.subtitleBrown),
          ),
          const SizedBox(height: 50),

          // Cards Grid Layout
          Wrap(
            spacing: 24,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: List.generate(_reportsData.length, (index) {
              bool isSelected = _selectedCardIndex == index;
              bool isAnySelected = _selectedCardIndex != null;
              bool shouldBlur = isAnySelected && !isSelected;

              return MouseRegion(
                key: _cardKeys[index], // Key attached for auto-centering scroll
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      if (_selectedCardIndex == index) {
                        _selectedCardIndex = null; // Deselect agar wahi click ho
                      } else {
                        _selectedCardIndex = index;
                        // Click hote hi card smooth animation ke sath screen ke center mein scroll hoga
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          _scrollToCard(index);
                        });
                      }
                    });
                  },
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 300),
                    opacity: shouldBlur ? 0.35 : 1.0, // Non-selected cards blur/fade ho jayenge
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOutCubic,
                      width: 360,
                      padding: const EdgeInsets.all(28),
                      transform: Matrix4.identity()
                        ..scale(isSelected ? 1.08 : 1.0), // Center zoom-in effect
                      transformAlignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: isSelected
                              ? AppColors.warmGold
                              : AppColors.warmGold.withValues(alpha: 0.3),
                          width: isSelected ? 2.5 : 1.0,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: isSelected
                                ? AppColors.warmGold.withValues(alpha: 0.4)
                                : Colors.black.withValues(alpha: 0.05),
                            blurRadius: isSelected ? 25 : 12,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _reportsData[index]['tag']!,
                                style: const TextStyle(
                                  color: AppColors.warmGold,
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.5,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                _reportsData[index]['title']!,
                                style: GoogleFonts.playfairDisplay(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primaryBrown,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                _reportsData[index]['desc']!,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: AppColors.subtitleBrown,
                                  height: 1.5,
                                ),
                              ),
                              const SizedBox(height: 30),
                              const Divider(color: AppColors.borderBrown, thickness: 0.8),
                              const SizedBox(height: 16),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    isSelected ? 'Selected Report' : 'Explore Report',
                                    style: const TextStyle(
                                      color: AppColors.deepBrown,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: isSelected
                                          ? AppColors.deepBrown
                                          : AppColors.deepBrown.withValues(alpha: 0.08),
                                    ),
                                    child: Icon(
                                      isSelected ? Icons.check : Icons.arrow_forward,
                                      size: 16,
                                      color: isSelected ? Colors.white : AppColors.deepBrown,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Positioned(
                            right: 0,
                            top: 0,
                            child: Text(
                              _reportsData[index]['number']!,
                              style: GoogleFonts.playfairDisplay(
                                fontSize: 64,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryBrown.withValues(alpha: 0.04),
                              ),
                            ),
                          ),
                        ],
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
  }
}
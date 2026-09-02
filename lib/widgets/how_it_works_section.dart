import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HowItWorksSection extends StatefulWidget {
  const HowItWorksSection({super.key});

  @override
  State<HowItWorksSection> createState() => _HowItWorksSectionState();
}

class _HowItWorksSectionState extends State<HowItWorksSection> {
  int _selectedIndex = 0; // Default first card highlighted rahega

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Small Top Badge
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
                  'SIMPLE PROCESS',
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
          const SizedBox(height: 16),

          // Main Heading
          Text(
            'How It Works',
            style: GoogleFonts.playfairDisplay(
              fontSize: 42,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF5B2C0E),
            ),
          ),
          const SizedBox(height: 12),

          // Subtitle
          const Text(
            'Get connected with expert astrologers in just 3 simple steps.',
            style: TextStyle(
              fontSize: 15,
              color: Color(0xFF7F4F24),
            ),
          ),
          const SizedBox(height: 50),

          // 3 Interactive Steps Row / Layout
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 900) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: _buildStepCard(0, '01', 'Choose Your Service', 'Select the type of consultation or report that fits your life questions.')),
                    const SizedBox(width: 24),
                    Expanded(child: _buildStepCard(1, '02', 'Share Your Details', 'Provide your birth details and specific questions for accurate insights.')),
                    const SizedBox(width: 24),
                    Expanded(child: _buildStepCard(2, '03', 'Get Expert Guidance', 'Connect directly with experienced astrologers and receive personalized remedies.')),
                  ],
                );
              } else {
                return Column(
                  children: [
                    _buildStepCard(0, '01', 'Choose Your Service', 'Select the type of consultation or report that fits your life questions.'),
                    const SizedBox(height: 20),
                    _buildStepCard(1, '02', 'Share Your Details', 'Provide your birth details and specific questions for accurate insights.'),
                    const SizedBox(height: 20),
                    _buildStepCard(2, '03', 'Get Expert Guidance', 'Connect directly with experienced astrologers and receive personalized remedies.'),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }

  // Interactive Step Card Builder with Zoom & Highlight Effect
  Widget _buildStepCard(int index, String number, String title, String description) {
    final bool isSelected = _selectedIndex == index;

    return MouseRegion(
      onEnter: (_) => setState(() => _selectedIndex = index), // Hover par activate hoga
      child: GestureDetector(
        onTap: () => setState(() => _selectedIndex = index), // Click par activate hoga
        child: AnimatedScale(
          scale: isSelected ? 1.03 : 1.0, // Thoda sa zoom effect
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFFFFFBF0) : const Color(0xFFFDFBF7),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: isSelected ? const Color(0xFFD4A373) : const Color(0xFFD4A373).withValues(alpha: 0.3),
                width: isSelected ? 1.8 : 1.0,
              ),
              boxShadow: [
                BoxShadow(
                  color: isSelected ? const Color(0xFFD4A373).withValues(alpha: 0.15) : Colors.black.withValues(alpha: 0.03),
                  blurRadius: isSelected ? 20 : 15,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Step Number Badge
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  decoration: BoxDecoration(
                    color: isSelected ? const Color(0xFFD4A373) : const Color(0xFF5B2C0E),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    number,
                    style: TextStyle(
                      color: isSelected ? const Color(0xFF5B2C0E) : Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Title
                Text(
                  title,
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF5B2C0E),
                  ),
                ),
                const SizedBox(height: 12),

                // Description
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
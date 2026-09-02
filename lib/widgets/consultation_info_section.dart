import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConsultationInfoSection extends StatelessWidget {
  const ConsultationInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFFFDFBF7), // Matching app background
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 80),
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 950) {
            // Desktop Layout: Row (Left Text, Right Image)
            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 6,
                  child: _buildTextContent(),
                ),
                const SizedBox(width: 50),
                Expanded(
                  flex: 6,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: _buildIllustration(),
                  ),
                ),
              ],
            );
          } else {
            // Mobile/Tablet Layout: Column
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTextContent(),
                const SizedBox(height: 40),
                Center(child: _buildIllustration()),
              ],
            );
          }
        },
      ),
    );
  }

  Widget _buildTextContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            style: GoogleFonts.playfairDisplay(
              fontSize: 42,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF5B2C0E),
              height: 1.2,
            ),
            children: const [
              TextSpan(text: 'Every Question Has An Answer –\n'),
              TextSpan(
                text: "Let's Find Yours",
                style: TextStyle(
                  color: Color(0xFFD4A373), // Gold accent matching reference
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          'Our expert astrologers, personally guided by experienced practitioners, will give you solutions, remedies, and direction you can trust.',
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFF5B2C0E),
            height: 1.6,
          ),
        ),
      ],
    );
  }

  Widget _buildIllustration() {
    return Container(
      constraints: const BoxConstraints(maxWidth: 580, maxHeight: 380),
      child: Image.asset(
        'assets/images/consultation_step.png', // Ensure this matches your file name in assets/images/
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            height: 280,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFF5B2C0E).withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFFD4A373), width: 1.5),
            ),
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.auto_awesome, size: 48, color: Color(0xFF5B2C0E)),
                  SizedBox(height: 12),
                  Text(
                    'Consultation Process Graphic',
                    style: TextStyle(
                      color: Color(0xFF5B2C0E),
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
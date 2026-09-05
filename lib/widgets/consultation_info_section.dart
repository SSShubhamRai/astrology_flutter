import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart'; // 1. URL Launcher import kiya gaya hai
import '../theme/app_colors.dart'; // Centralized AppColors import kiya gaya hai

class ConsultationInfoSection extends StatelessWidget {
  const ConsultationInfoSection({super.key});

  // 2. Google Form open karne ki function
  Future<void> _bookConsultation(BuildContext context) async {
    final Uri url = Uri.parse('https://docs.google.com/forms/d/e/1FAIpQLSfheuBKfCbYE00rQsH9Yd50n9ap_i-uI5lVqGhnzOh37o6Pzg/viewform?usp=publish-editor'); // Yahan apna Google Form link paste karein
    
    try {
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      } else {
        throw 'Could not launch $url';
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not open booking form: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.creamBg, // Centralized cream background tone
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
                  child: _buildTextContent(context),
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
                _buildTextContent(context),
                const SizedBox(height: 40),
                Center(child: _buildIllustration()),
              ],
            );
          }
        },
      ),
    );
  }

  Widget _buildTextContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            style: GoogleFonts.playfairDisplay(
              fontSize: 42,
              fontWeight: FontWeight.bold,
              color: AppColors.deepBrown,
              height: 1.2,
            ),
            children: const [
              TextSpan(text: 'Every Question Has An Answer –\n'),
              TextSpan(
                text: "Let's Find Yours",
                style: TextStyle(
                  color: AppColors.warmGold, // Centralized warm gold accent
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
            color: AppColors.subtitleBrown,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 32),
        
        // 3. Book Your Consultation Button Added Here
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryBrown,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            elevation: 4,
          ),
          onPressed: () => _bookConsultation(context),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Book Your Consultation',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 8),
              Icon(Icons.arrow_forward_rounded, size: 18),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildIllustration() {
    return Container(
      constraints: const BoxConstraints(maxWidth: 580, maxHeight: 380),
      child: Image.asset(
        'assets/images/consultation_step.png',
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            height: 280,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.deepBrown.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.warmGold, width: 1.5),
            ),
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.auto_awesome, size: 48, color: AppColors.deepBrown),
                  SizedBox(height: 12),
                  Text(
                    'Consultation Process Graphic',
                    style: TextStyle(
                      color: AppColors.deepBrown,
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
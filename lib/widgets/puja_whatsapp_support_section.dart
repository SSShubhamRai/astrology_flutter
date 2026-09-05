import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart'; // 1. URL Launcher import kiya gaya hai
import '../theme/app_colors.dart'; // Centralized AppColors import kiya gaya hai

class PujaWhatsappSupportSection extends StatelessWidget {
  const PujaWhatsappSupportSection({super.key});

  // 2. WhatsApp chat open karne ki function
  Future<void> _openWhatsApp(BuildContext context) async {
    // Apna WhatsApp number country code ke sath dalein (jaise '91' India ke liye)
    const String phoneNumber = '917763022458'; 
    const String message = 'Hello, I need help with booking a Puja on Numeris.';
    
    final Uri url = Uri.parse('https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}');
    
    try {
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      } else {
        throw 'Could not launch $url';
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not open WhatsApp: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.creamBg, // Centralized cream background tone
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 30),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.borderBrown.withValues(alpha: 0.6)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 15,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                bool isWide = constraints.maxWidth > 750;
                if (isWide) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildTextContent(),
                      _buildWhatsAppButton(context),
                    ],
                  );
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTextContent(),
                      const SizedBox(height: 20),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: _buildWhatsAppButton(context),
                      ),
                    ],
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Need help in booking Puja?',
          style: GoogleFonts.playfairDisplay(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryBrown,
          ),
        ),
        const SizedBox(height: 6),
        const Text(
          'Our team is here to help you with any questions or concerns about your puja booking.',
          style: TextStyle(
            fontSize: 14,
            color: AppColors.subtitleBrown,
          ),
        ),
      ],
    );
  }

  Widget _buildWhatsAppButton(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF25D366), // Official WhatsApp Green color
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 2,
          ),
          onPressed: () => _openWhatsApp(context), // 3. Function yahan attach kiya gaya hai
          icon: const Icon(Icons.chat, size: 18),
          label: const Text(
            'Chat on WhatsApp',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 6),
        const Text(
          '24/7 support available',
          style: TextStyle(
            fontSize: 11.5,
            color: AppColors.subtitleBrown,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
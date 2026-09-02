import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CtaBannerSection extends StatelessWidget {
  const CtaBannerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 450),
      decoration: BoxDecoration(
        color: const Color(0xFF3D1C06), // Fallback deep mahogany color
        image: const DecorationImage(
          image: AssetImage('assets/images/cta_bg.png'),
          fit: BoxFit.cover,
          alignment: Alignment.centerRight, // Image right side align rahegi
        ),
      ),
      child: Container(
        // Left side par text ke liye dark gradient overlay taaki text easily readable ho
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color(0xFF3D1C06),
              const Color(0xFF3D1C06).withValues(alpha: 0.85),
              Colors.transparent,
            ],
            stops: const [0.0, 0.5, 1.0],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 70),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Small Top Badge
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFD4A373).withValues(alpha: 0.6)),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black.withValues(alpha: 0.3),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.auto_awesome, color: Color(0xFFD4A373), size: 14),
                    SizedBox(width: 8),
                    Text(
                      'TAKE THE NEXT STEP',
                      style: TextStyle(
                        color: Color(0xFFE6CCB2),
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Main Heading
              Text(
                'One Decision Today Can Change Your Tomorrow',
                style: GoogleFonts.playfairDisplay(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  height: 1.15,
                ),
              ),
              const SizedBox(height: 20),

              // Subtitle
              const Text(
                'Slots fill up quickly — don’t delay getting the clarity and answers you’ve been waiting for. Book your consultation with our expert team today.',
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFFE6CCB2),
                  height: 1.6,
                ),
              ),
              const SizedBox(height: 36),

              // CTA Button
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
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    foregroundColor: const Color(0xFF5B2C0E),
                    padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {},
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Book Your Consultation',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.arrow_forward, size: 18),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
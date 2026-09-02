import 'package:flutter/material.dart';

class ExpertReportSection extends StatelessWidget {
  const ExpertReportSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFFFDFBF7),
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 50,
            runSpacing: 30,
            children: [
              // Left Side: Profile Avatar & Name
              Column(
                children: [
                  Container(
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: const Color(0xFFE6CCB2), width: 3),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.08),
                          blurRadius: 15,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/shubham .jpg',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.person, size: 70, color: Color(0xFF5B2C0E));
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Shubham Kumar',
                    style: TextStyle(
                      color: Color(0xFF5B2C0E),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Numerology Expert',
                    style: TextStyle(
                      color: Color(0xFF8C7A6B),
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),

              // Right Side: Content & Topic Chips
              SizedBox(
                width: 700,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Everything You Need,\nIn One Report',
                      style: TextStyle(
                        fontFamily: 'serif',
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF5B2C0E),
                        height: 1.15,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Get personalized insights across the most important areas of your life through your unique numbers.',
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFF7F5539),
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 28),

                    // Category Chips
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: [
                        _buildReportChip(Icons.auto_awesome, 'Life Path'),
                        _buildReportChip(Icons.trending_up, 'Career'),
                        _buildReportChip(Icons.favorite_border, 'Relationships'),
                        _buildReportChip(Icons.currency_rupee, 'Finance'),
                        _buildReportChip(Icons.stars, 'Personality'),
                        _buildReportChip(Icons.track_changes, 'Life Purpose'),
                      ],
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

  Widget _buildReportChip(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: const Color(0xFFD4A373).withValues(alpha: 0.5), width: 1.2),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: const Color(0xFF5B2C0E)),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(
              color: Color(0xFF5B2C0E),
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
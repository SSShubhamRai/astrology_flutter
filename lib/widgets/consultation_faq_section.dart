import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart'; // Centralized AppColors import kiya gaya hai

class ConsultationFaqSection extends StatefulWidget {
  const ConsultationFaqSection({super.key});

  @override
  State<ConsultationFaqSection> createState() => _ConsultationFaqSectionState();
}

class _ConsultationFaqSectionState extends State<ConsultationFaqSection> {
  int? _expandedIndex = 0;

  final List<Map<String, String>> _faqs = [
    {
      'question': 'How do I book a consultation session with an expert?',
      'answer': 'You can select your preferred expert guidance plan, choose between normal or urgent mode, and click "Consult Now" or "Book Your Consultation" to securely schedule your session.'
    },
    {
      'question': 'What details do I need to provide before the session?',
      'answer': 'You will need to provide your basic birth details (date, time, and place of birth) along with specific questions or areas of life you want guidance on.'
    },
    {
      'question': 'Are the consultations confidential?',
      'answer': 'Yes, absolutely. All personal details, birth charts, and consultation discussions remain 100% confidential and secure.'
    },
    {
      'question': 'What is the difference between Normal and Urgent modes?',
      'answer': 'Normal mode schedules your consultation through standard booking queues, whereas Urgent mode grants you priority access for faster turnaround and immediate slot allocation.'
    },
    {
      'question': 'Can I reschedule my appointment if needed?',
      'answer': 'Yes, you can easily reschedule your session by reaching out to our support team or updating it directly through your dashboard prior to the scheduled time.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
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
                  'GOT QUESTIONS?',
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
          Text(
            'Frequently Asked Questions',
            style: GoogleFonts.playfairDisplay(
              fontSize: 42,
              fontWeight: FontWeight.bold,
              color: AppColors.deepBrown,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Find quick answers to common queries regarding our consultation services.',
            style: TextStyle(
              fontSize: 15,
              color: AppColors.subtitleBrown,
            ),
          ),
          const SizedBox(height: 50),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Column(
              children: List.generate(_faqs.length, (index) {
                bool isExpanded = _expandedIndex == index;
                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: isExpanded ? const Color(0xFFFFFBF0) : AppColors.creamBg,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: isExpanded ? AppColors.warmGold : AppColors.warmGold.withValues(alpha: 0.3),
                      width: isExpanded ? 1.5 : 1.0,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.03),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ExpansionTile(
                    initiallyExpanded: isExpanded,
                    onExpansionChanged: (expanded) {
                      setState(() {
                        _expandedIndex = expanded ? index : null;
                      });
                    },
                    collapsedIconColor: AppColors.deepBrown,
                    iconColor: AppColors.deepBrown,
                    title: Text(
                      _faqs[index]['question']!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.deepBrown,
                      ),
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
                        child: Text(
                          _faqs[index]['answer']!,
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.subtitleBrown,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
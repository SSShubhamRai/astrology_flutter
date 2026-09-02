import 'package:flutter/material.dart';

class FaqSection extends StatefulWidget {
  const FaqSection({super.key});

  @override
  State<FaqSection> createState() => _FaqSectionState();
}

class _FaqSectionState extends State<FaqSection> {
  // Track karega ki kaun sa tile khula hai (-1 matlab sab band hain)
  int? _expandedIndex;

  final List<Map<String, String>> _faqs = const [
    {
      'question': 'How accurate are these numerology and astrology predictions?',
      'answer': 'Our reports are generated using authentic ancient Vedic principles combined with modern computational algorithms, ensuring high precision and personalized insights tailored strictly to your birth details.',
    },
    {
      'question': 'How can I access my reports after purchase?',
      'answer': 'Once purchased, your reports are instantly linked to your account. You can access them anytime under the "My Reports" section in your profile or dashboard.',
    },
    {
      'question': 'What details are required to generate my full astro report?',
      'answer': 'To generate an accurate report, you need to provide your full legal name, exact date of birth, time of birth, and place of birth.',
    },
    {
      'question': 'Can I get a personalized consultation with expert astrologers?',
      'answer': 'Yes! You can explore our "Expert Consultation" section in the app to book one-on-one sessions with verified professional astrologers and numerologists.',
    },
    {
      'question': 'Is my personal and birth data secure?',
      'answer': 'We prioritize your privacy. All your personal data and birth details are completely encrypted and securely stored, and are never shared with third parties.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Section Subtitle
              Text(
                'GOT QUESTIONS?',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.8,
                  color: colorScheme.secondary,
                ),
              ),
              const SizedBox(height: 8),
              // Section Title
              Text(
                'Frequently Asked Questions',
                style: TextStyle(
                  fontFamily: 'serif',
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: colorScheme.primary,
                ),
              ),
              const SizedBox(height: 40),

              // FAQ Accordion List
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _faqs.length,
                itemBuilder: (context, index) {
                  final faq = _faqs[index];
                  final isExpanded = _expandedIndex == index;

                  return Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: ExpansionTile(
                        key: Key(index.toString()),
                        initiallyExpanded: isExpanded,
                        onExpansionChanged: (expanded) {
                          setState(() {
                            _expandedIndex = expanded ? index : null;
                          });
                        },
                        title: Text(
                          faq['question']!,
                          style: TextStyle(
                            color: colorScheme.primary,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        iconColor: colorScheme.primary,
                        collapsedIconColor: colorScheme.primary.withValues(alpha: 0.7),
                        childrenPadding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                        expandedCrossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            faq['answer']!,
                            style: TextStyle(
                              color: colorScheme.primary.withValues(alpha: 0.8),
                              fontSize: 15,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
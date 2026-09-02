import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VastuConsultantSection extends StatefulWidget {
  const VastuConsultantSection({super.key});

  @override
  State<VastuConsultantSection> createState() => _VastuConsultantSectionState();
}

class _VastuConsultantSectionState extends State<VastuConsultantSection> {
  int _selectedSizeIndex = 3;

  final List<Map<String, dynamic>> _propertySizes = [
    {'label': 'Up to 1100 sq ft', 'price': '₹1,50,000'},
    {'label': '1101–2100 sq ft', 'price': '₹2,50,000'},
    {'label': '2101–3500 sq ft', 'price': '₹4,00,000'},
    {'label': '3501–5000 sq ft', 'price': '₹6,00,000'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFFFDFBF7),
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
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
                  'EXPERT GUIDANCE',
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
          Text(
            'Meet Our Expert Vastu Consultant',
            style: GoogleFonts.playfairDisplay(
              fontSize: 42,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF5B2C0E),
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Get personalized Vastu guidance designed to bring balance, harmony and positive energy to your space.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              color: Color(0xFF7F4F24),
            ),
          ),
          const SizedBox(height: 50),

          // Main Card Container with IntrinsicHeight to fix infinite height error
          Container(
            constraints: const BoxConstraints(maxWidth: 1100),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: const Color(0xFFD4A373).withValues(alpha: 0.4), width: 1.2),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 900) {
                  return IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(flex: 4, child: _buildLeftImageView(context)),
                        Expanded(flex: 7, child: _buildRightContentView()),
                      ],
                    ),
                  );
                } else {
                  return Column(
                    children: [
                      _buildLeftImageView(context, isMobile: true),
                      _buildRightContentView(),
                    ],
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLeftImageView(BuildContext context, {bool isMobile = false}) {
    return Container(
      constraints: BoxConstraints(minHeight: isMobile ? 350 : 500),
      decoration: BoxDecoration(
        borderRadius: isMobile
            ? const BorderRadius.vertical(top: Radius.circular(23))
            : const BorderRadius.horizontal(left: Radius.circular(23)),
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: isMobile
                  ? const BorderRadius.vertical(top: Radius.circular(23))
                  : const BorderRadius.horizontal(left: Radius.circular(23)),
              child: Image.asset(
                'assets/images/vastu_expert.png',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: const Color(0xFF5B2C0E).withValues(alpha: 0.1),
                    child: const Center(
                      child: Icon(Icons.person, size: 80, color: Color(0xFF5B2C0E)),
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.95),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFD4A373).withValues(alpha: 0.4)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Premium Vastu Expert',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF5B2C0E),
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Hand-picked expert providing personalized Vastu guidance for homes, offices and businesses.',
                  style: TextStyle(fontSize: 11.5, color: Colors.grey, height: 1.4),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRightContentView() {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Known For',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF5B2C0E)),
          ),
          const SizedBox(height: 12),
          const Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Icon(Icons.check_circle_outline, size: 16, color: Color(0xFFD4A373)),
                    SizedBox(width: 8),
                    Text('Layout & energy analysis', style: TextStyle(fontSize: 13, color: Colors.grey)),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Icon(Icons.check_circle_outline, size: 16, color: Color(0xFFD4A373)),
                    SizedBox(width: 8),
                    Text('Auspicious timing guidance', style: TextStyle(fontSize: 13, color: Colors.grey)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Icon(Icons.check_circle_outline, size: 16, color: Color(0xFFD4A373)),
                    SizedBox(width: 8),
                    Text('Practical Vastu remedies', style: TextStyle(fontSize: 13, color: Colors.grey)),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Icon(Icons.check_circle_outline, size: 16, color: Color(0xFFD4A373)),
                    SizedBox(width: 8),
                    Text('Guidance for home & business', style: TextStyle(fontSize: 13, color: Colors.grey)),
                  ],
                ),
              ),
            ],
          ),
          const Divider(height: 35, thickness: 1),
          const Text(
            'Consultation Details',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF5B2C0E)),
          ),
          const SizedBox(height: 12),
          const Row(
            children: [
              Icon(Icons.access_time_rounded, size: 16, color: Color(0xFFD4A373)),
              SizedBox(width: 10),
              Text('Consultation duration based on property requirements', style: TextStyle(fontSize: 13, color: Colors.grey)),
            ],
          ),
          const SizedBox(height: 8),
          const Row(
            children: [
              Icon(Icons.calendar_today_rounded, size: 16, color: Color(0xFFD4A373)),
              SizedBox(width: 10),
              Text('Appointment scheduled after booking', style: TextStyle(fontSize: 13, color: Colors.grey)),
            ],
          ),
          const Divider(height: 35, thickness: 1),
          const Text(
            'SELECT PROPERTY SIZE',
            style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFF5B2C0E), letterSpacing: 1.0),
          ),
          const SizedBox(height: 14),
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: const Color(0xFFFDFBF7),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: const Color(0xFFD4A373).withValues(alpha: 0.4)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(_propertySizes.length, (index) {
                bool isSelected = _selectedSizeIndex == index;
                return Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => _selectedSizeIndex = index),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: isSelected ? const Color(0xFF5B2C0E) : Colors.transparent,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Text(
                        _propertySizes[index]['label'],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 11.5,
                          fontWeight: FontWeight.bold,
                          color: isSelected ? Colors.white : const Color(0xFF5B2C0E),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Note: Consultation pricing and duration may vary depending on your specific requirements.',
            style: TextStyle(fontSize: 10, color: Colors.grey),
          ),
          const Divider(height: 35, thickness: 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('PRICE STARTING FROM', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 0.8)),
                  const SizedBox(height: 2),
                  Text(
                    _propertySizes[_selectedSizeIndex]['price'],
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF5B2C0E)),
                  ),
                  const Text('Inclusive of applicable taxes', style: TextStyle(fontSize: 10, color: Colors.grey)),
                ],
              ),
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
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    foregroundColor: const Color(0xFF5B2C0E),
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {},
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Consult Now', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward, size: 16),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
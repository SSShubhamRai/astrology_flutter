import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart'; // Centralized AppColors import kiya gaya hai

class AllPujasGridSection extends StatefulWidget {
  const AllPujasGridSection({super.key});

  @override
  State<AllPujasGridSection> createState() => _AllPujasGridSectionState();
}

class _AllPujasGridSectionState extends State<AllPujasGridSection> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  String? _selectedFilterCategory;
  String? _selectedFilterValue;

  final List<Map<String, dynamic>> _allPujas = [
    {
      'title': 'Aquarius Lagna E-Puja',
      'subtitle': 'For Better Clarity, Stability, and Positive Growth in Life.',
      'location': 'Shani Navgrah Temple, Ujjain, Madhya Pradesh',
      'date': '5 September 2026',
      'rating': '4.8',
      'devotees': '17K+ booked by devotees',
      'image': 'assets/images/pooja_shiv.png',
      'category': 'Puja for',
      'value': 'Clarity & Stability',
    },
    {
      'title': 'Shani Graha Shanti E-Puja',
      'subtitle': 'For Peace, Success & Life Balance',
      'location': 'Pardeshwar Temple, Ujjain, Madhya Pradesh',
      'date': '5 September 2026',
      'rating': '4.9',
      'devotees': '21K+ booked by devotees',
      'image': 'assets/images/pooja_shiv.png',
      'category': 'Dosha',
      'value': 'Shani Dosha',
    },
    {
      'title': 'Leo Lagna E-Puja',
      'subtitle': 'For Confidence, Leadership & Success',
      'location': 'Surya Mandir, Surya Kund, Ayodhya, Uttar Pradesh',
      'date': '6 September 2026',
      'rating': '4.7',
      'devotees': '12K+ booked by devotees',
      'image': 'assets/images/pooja_shiv.png',
      'category': 'Deity',
      'value': 'Surya',
    },
    {
      'title': 'Surya Grah Shanti Online Puja',
      'subtitle': 'For Vitality, Authority & Career Growth',
      'location': 'Sun Temple, Modhera, Gujarat',
      'date': '7 September 2026',
      'rating': '4.9',
      'devotees': '15K+ booked by devotees',
      'image': 'assets/images/pooja_shiv.png',
      'category': 'Benefits',
      'value': 'Career Growth',
    },
    {
      'title': 'Navgrah Shanti Online Puja',
      'subtitle': 'To Balance All Planetary Influences',
      'location': 'Navgrah Temple, Guwahati, Assam',
      'date': '8 September 2026',
      'rating': '4.8',
      'devotees': '19K+ booked by devotees',
      'image': 'assets/images/pooja_shiv.png',
      'category': 'Dosha',
      'value': 'Navgrah Dosha',
    },
    {
      'title': 'Vivah Siddhi Puja (Marriage Delay Solution)',
      'subtitle': 'Remove Obstacles in Marriage & Find Suitable Match',
      'location': 'Katyayani Temple, Vrindavan, Uttar Pradesh',
      'date': '9 September 2026',
      'rating': '4.9',
      'devotees': '25K+ booked by devotees',
      'image': 'assets/images/pooja_shiv.png',
      'category': 'Benefits',
      'value': 'Marriage Solution',
    },
  ];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _searchQuery = _searchController.text.toLowerCase();
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filteredPujas = _allPujas.where((puja) {
      final matchesSearch = puja['title'].toString().toLowerCase().contains(_searchQuery) ||
          puja['subtitle'].toString().toLowerCase().contains(_searchQuery) ||
          puja['location'].toString().toLowerCase().contains(_searchQuery);

      bool matchesFilter = true;
      if (_selectedFilterValue != null && _selectedFilterValue != 'All') {
        matchesFilter = puja['value'] == _selectedFilterValue || puja['category'] == _selectedFilterCategory;
      }

      return matchesSearch && matchesFilter;
    }).toList();

    return Container(
      width: double.infinity,
      color: AppColors.creamBg, // Centralized cream background tone
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'All Pujas',
            style: GoogleFonts.playfairDisplay(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryBrown,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Browse authentic Pujas performed in your name and gotra at trusted temples',
            style: TextStyle(fontSize: 14, color: AppColors.subtitleBrown),
          ),
          const SizedBox(height: 30),

          // Search Bar & Filter Chips Row
          Container(
            constraints: const BoxConstraints(maxWidth: 900),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              children: [
                TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search for Pujas, Temples or Benefits...',
                    hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
                    prefixIcon: const Icon(Icons.search, color: AppColors.deepBrown),
                    suffixIcon: _searchQuery.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear, size: 18),
                            onPressed: () => _searchController.clear(),
                          )
                        : null,
                    filled: true,
                    fillColor: AppColors.creamBg,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    _buildFilterDropdown('Puja for', ['All', 'Clarity & Stability']),
                    _buildFilterDropdown('Benefits', ['All', 'Career Growth', 'Marriage Solution']),
                    _buildFilterDropdown('Deity', ['All', 'Surya']),
                    _buildFilterDropdown('Location', ['All', 'Ujjain', 'Ayodhya']),
                    _buildFilterDropdown('Dosha', ['All', 'Shani Dosha', 'Navgrah Dosha']),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),

          filteredPujas.isEmpty
              ? const Padding(
                  padding: EdgeInsets.symmetric(vertical: 40),
                  child: Text(
                    'No pujas found matching your search.',
                    style: TextStyle(fontSize: 16, color: AppColors.subtitleBrown, fontWeight: FontWeight.w500),
                  ),
                )
              : LayoutBuilder(
                  builder: (context, constraints) {
                    int crossAxisCount = constraints.maxWidth > 1100 ? 3 : (constraints.maxWidth > 700 ? 2 : 1);
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: filteredPujas.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        crossAxisSpacing: 28,
                        mainAxisSpacing: 28,
                        childAspectRatio: 0.80,
                      ),
                      itemBuilder: (context, index) {
                        final puja = filteredPujas[index];
                        return AnimatedPujaCard(puja: puja);
                      },
                    );
                  },
                ),
        ],
      ),
    );
  }

  Widget _buildFilterDropdown(String label, List<String> options) {
    bool isSelected = _selectedFilterCategory == label;
    return PopupMenuButton<String>(
      onSelected: (value) {
        setState(() {
          _selectedFilterCategory = label;
          _selectedFilterValue = value;
        });
      },
      itemBuilder: (context) => options.map((option) => PopupMenuItem(value: option, child: Text(option))).toList(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? AppColors.deepBrown : AppColors.warmGold.withValues(alpha: 0.4),
          ),
          borderRadius: BorderRadius.circular(20),
          color: isSelected ? AppColors.deepBrown.withValues(alpha: 0.08) : Colors.white,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              isSelected && _selectedFilterValue != 'All' ? '$label: $_selectedFilterValue' : label,
              style: TextStyle(
                fontSize: 13,
                color: AppColors.deepBrown,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              ),
            ),
            const SizedBox(width: 4),
            const Icon(Icons.keyboard_arrow_down, size: 16, color: AppColors.deepBrown),
          ],
        ),
      ),
    );
  }
}

// Larger, Spacious & Animated Puja Card Widget
class AnimatedPujaCard extends StatefulWidget {
  final Map<String, dynamic> puja;
  const AnimatedPujaCard({super.key, required this.puja});

  @override
  State<AnimatedPujaCard> createState() => _AnimatedPujaCardState();
}

class _AnimatedPujaCardState extends State<AnimatedPujaCard> {
  bool _showRated = true;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (mounted) {
        setState(() {
          _showRated = !_showRated;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final puja = widget.puja;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.borderBrown.withValues(alpha: 0.6)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Larger Banner Image with Poojan Badge (Height 210)
          SizedBox(
            height: 210,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    puja['image'],
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [AppColors.deepBrown, Color(0xFF2B1405)],
                        ),
                      ),
                      child: const Center(
                        child: Icon(Icons.temple_hindu, size: 60, color: AppColors.warmGold),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.transparent, Colors.black.withValues(alpha: 0.7)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 14,
                    right: 14,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('ॐ', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.deepBrown)),
                          SizedBox(width: 4),
                          Text(
                            'POOJAN',
                            style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppColors.deepBrown),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Card Body Content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    puja['title'],
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryBrown,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    puja['subtitle'],
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 13, color: AppColors.subtitleBrown, height: 1.4),
                  ),
                  const Spacer(),
                  const Divider(height: 20, color: Color(0xFFEFE3D0)),
                  
                  // Location
                  Row(
                    children: [
                      const Icon(Icons.location_on_outlined, size: 15, color: AppColors.warmGold),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          puja['location'],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 12, color: Color(0xFF9C6644)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),

                  // Date
                  Row(
                    children: [
                      const Icon(Icons.calendar_today_outlined, size: 14, color: AppColors.warmGold),
                      const SizedBox(width: 6),
                      Text(
                        puja['date'],
                        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.deepBrown),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),

                  // Bottom Animated Switching Row: Rated vs Booked By & Book Now Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 36,
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 500),
                          child: _showRated
                              ? Column(
                                  key: const ValueKey('rated'),
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text('Rated', style: TextStyle(fontSize: 10, color: Color(0xFF9C6644), height: 1)),
                                    const SizedBox(height: 3),
                                    Row(
                                      children: [
                                        const Icon(Icons.star, size: 14, color: Colors.amber),
                                        const SizedBox(width: 4),
                                        Text('${puja['rating']} by devotees', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.primaryBrown)),
                                      ],
                                    ),
                                  ],
                                )
                              : Column(
                                  key: const ValueKey('booked'),
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text('Booked', style: TextStyle(fontSize: 10, color: Color(0xFF9C6644), height: 1)),
                                    const SizedBox(height: 3),
                                    Text(puja['devotees'], style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.primaryBrown)),
                                  ],
                                ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFE76F51),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text('Book Now', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  } 
}
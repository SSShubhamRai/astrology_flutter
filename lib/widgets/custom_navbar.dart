import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../theme/app_colors.dart'; // Centralized AppColors import kiya gaya hai

class CustomNavbar extends StatefulWidget {
  const CustomNavbar({super.key});

  @override
  State<CustomNavbar> createState() => _CustomNavbarState();
}

class _CustomNavbarState extends State<CustomNavbar> {
  final List<String> leftLinks = ['Numerology', 'Reports', 'Consultation'];
  final List<String> rightLinks = ['Courses', 'Poojan', 'About'];

  // Helper method to determine active item based on current route
  String _getActiveItemFromRoute(BuildContext context) {
    final String location = GoRouterState.of(context).uri.path;
    if (location.startsWith('/reports')) return 'Reports';
    if (location.startsWith('/consultation')) return 'Consultation';
    if (location.startsWith('/courses')) return 'Courses';
    if (location.startsWith('/poojan')) return 'Poojan';
    if (location.startsWith('/about')) return 'About';
    if (location.startsWith('/login')) return 'Login';
    return 'Numerology'; // Default route '/'
  }

  @override
  Widget build(BuildContext context) {
    // Automatically get the current active item based on the active URL
    final String _activeItem = _getActiveItemFromRoute(context);

    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        final User? user = snapshot.data;

        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.75),
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(color: Colors.white.withValues(alpha: 0.6)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.06),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    // 1. Left Links
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: leftLinks.map((title) {
                          bool isSelected = _activeItem == title;
                          bool hasDropdown = (title == 'Numerology' || title == 'Reports');

                          return GestureDetector(
                            onTap: () {
                              if (title == 'Consultation') {
                                context.go('/consultation');
                              } else if (title == 'Reports') {
                                context.go('/reports');
                              } else if (title == 'Numerology') {
                                context.go('/');
                              }
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 250),
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              margin: const EdgeInsets.symmetric(horizontal: 2),
                              decoration: BoxDecoration(
                                color: isSelected ? AppColors.primaryBrown : Colors.transparent,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    title,
                                    style: TextStyle(
                                      color: isSelected ? Colors.white : AppColors.primaryBrown.withValues(alpha: 0.85),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13.5,
                                    ),
                                  ),
                                  if (hasDropdown) ...[
                                    const SizedBox(width: 2),
                                    Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      size: 16,
                                      color: isSelected ? Colors.white : AppColors.primaryBrown.withValues(alpha: 0.7),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),

                    // 2. Center Logo Section (Numeris)
                    GestureDetector(
                      onTap: () {
                        context.go('/');
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 36,
                              height: 36,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.primaryBrown.withValues(alpha: 0.08),
                                border: Border.all(color: AppColors.warmGold, width: 1.5),
                              ),
                              child: const Center(
                                child: Text(
                                  'N',
                                  style: TextStyle(
                                    fontFamily: 'serif',
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryBrown,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'Numeris',
                              style: TextStyle(
                                fontFamily: 'serif',
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryBrown,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // 3. Right Links & Auth / CTA Button
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ...rightLinks.map((title) {
                            bool isSelected = _activeItem == title;

                            return GestureDetector(
                              onTap: () {
                                if (title == 'About') context.go('/about');
                                else if (title == 'Courses') context.go('/courses');
                                else if (title == 'Poojan') context.go('/poojan');
                              },
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 250),
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                margin: const EdgeInsets.symmetric(horizontal: 2),
                                decoration: BoxDecoration(
                                  color: isSelected ? AppColors.primaryBrown : Colors.transparent,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  title,
                                  style: TextStyle(
                                    color: isSelected ? Colors.white : AppColors.primaryBrown.withValues(alpha: 0.85),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13.5,
                                  ),
                                ),
                              ),
                            );
                          }),
                          const SizedBox(width: 8),

                          // Dynamic Login vs User Profile Menu with Google Avatar Fix
                          if (user == null)
                            GestureDetector(
                              onTap: () => context.go('/login'),
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 250),
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                margin: const EdgeInsets.symmetric(horizontal: 2),
                                decoration: BoxDecoration(
                                  color: _activeItem == 'Login' ? AppColors.primaryBrown : Colors.transparent,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                    color: _activeItem == 'Login' ? Colors.white : AppColors.primaryBrown.withValues(alpha: 0.85),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13.5,
                                  ),
                                ),
                              ),
                            )
                          else
                            PopupMenuButton<String>(
                              offset: const Offset(0, 45),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      width: 32,
                                      height: 32,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(color: AppColors.warmGold, width: 1.5),
                                      ),
                                      child: ClipOval(
                                        child: user.photoURL != null && user.photoURL!.isNotEmpty
                                            ? Image.network(
                                                user.photoURL!,
                                                fit: BoxFit.cover,
                                                width: 32,
                                                height: 32,
                                                errorBuilder: (context, error, stackTrace) {
                                                  return Container(
                                                    color: AppColors.warmGold,
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      user.displayName != null && user.displayName!.isNotEmpty
                                                          ? user.displayName![0].toUpperCase()
                                                          : 'U',
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 13,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              )
                                            : Container(
                                                color: AppColors.warmGold,
                                                alignment: Alignment.center,
                                                child: Text(
                                                  user.displayName != null && user.displayName!.isNotEmpty
                                                      ? user.displayName![0].toUpperCase()
                                                      : 'U',
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 13,
                                                  ),
                                                ),
                                              ),
                                      ),
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                      user.displayName?.split(' ').first ?? 'User',
                                      style: const TextStyle(fontWeight: FontWeight.w600, color: AppColors.primaryBrown, fontSize: 13.5),
                                    ),
                                    const Icon(Icons.arrow_drop_down, color: AppColors.primaryBrown, size: 20),
                                  ],
                                ),
                              ),
                              itemBuilder: (context) => [
                                PopupMenuItem(
                                  value: 'logout',
                                  child: Row(
                                    children: const [
                                      Icon(Icons.logout, color: Colors.red, size: 18),
                                      SizedBox(width: 10),
                                      Text('Logout', style: TextStyle(color: Colors.red, fontWeight: FontWeight.w500)),
                                    ],
                                  ),
                                ),
                              ],
                              onSelected: (value) async {
                                if (value == 'logout') {
                                  await GoogleSignIn().signOut();
                                  await FirebaseAuth.instance.signOut();
                                  if (context.mounted) {
                                    context.go('/login');
                                  }
                                }
                              },
                            ),
                          const SizedBox(width: 10),

                          // Gold Gradient CTA Button
                          Container(
                            decoration: BoxDecoration(
                              gradient: AppColors.goldGradient,
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.warmGold.withValues(alpha: 0.4),
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                                foregroundColor: AppColors.primaryBrown,
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              onPressed: () {
                                context.go('/consultation');
                              },
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Get Your Report',
                                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(width: 6),
                                  Icon(Icons.arrow_forward, size: 15),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
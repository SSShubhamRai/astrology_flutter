import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/home_screen.dart';
import 'screens/consultation_screen.dart';

// GoRouter configuration
final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/consultation',
      builder: (context, state) => const ConsultationScreen(),
    ),
  ],
);

void main() {
  runApp(const AstroApp());
}

class AstroApp extends StatelessWidget {
  const AstroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Astro Arun Pandit Clone',
      debugShowCheckedModeBanner: false,
      routerConfig: _router, // MaterialApp ki jagah MaterialApp.router aur routerConfig use kiya gaya hai
      theme: ThemeData(
        primaryColor: const Color(0xFF5B2C0E),
        scaffoldBackgroundColor: const Color(0xFFFDFBF7),
        // Applying Poppins globally using textTheme override safely
        textTheme: TextTheme(
          bodyLarge: GoogleFonts.poppins(color: const Color(0xFF5B2C0E)),
          bodyMedium: GoogleFonts.poppins(color: const Color(0xFF5B2C0E)),
          bodySmall: GoogleFonts.poppins(color: const Color(0xFF5B2C0E)),
          displayLarge: GoogleFonts.poppins(color: const Color(0xFF5B2C0E)),
          displayMedium: GoogleFonts.poppins(color: const Color(0xFF5B2C0E)),
          displaySmall: GoogleFonts.poppins(color: const Color(0xFF5B2C0E)),
          headlineLarge: GoogleFonts.poppins(color: const Color(0xFF5B2C0E)),
          headlineMedium: GoogleFonts.poppins(color: const Color(0xFF5B2C0E)),
          headlineSmall: GoogleFonts.poppins(color: const Color(0xFF5B2C0E)),
          titleLarge: GoogleFonts.poppins(color: const Color(0xFF5B2C0E)),
          titleMedium: GoogleFonts.poppins(color: const Color(0xFF5B2C0E)),
          titleSmall: GoogleFonts.poppins(color: const Color(0xFF5B2C0E)),
          labelLarge: GoogleFonts.poppins(color: const Color(0xFF5B2C0E)),
          labelMedium: GoogleFonts.poppins(color: const Color(0xFF5B2C0E)),
          labelSmall: GoogleFonts.poppins(color: const Color(0xFF5B2C0E)),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF5B2C0E),
          secondary: const Color(0xFFD4A373),
        ),
        useMaterial3: true,
      ),
    );
  }
}
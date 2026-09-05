import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'theme/app_colors.dart';
import 'screens/home_screen.dart';
import 'screens/consultation_screen.dart';
import 'screens/reports_screen.dart'; 
import 'screens/poojan_screen.dart';
import 'screens/about_screen.dart';
import 'screens/login_screen.dart';

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
    GoRoute(
      path: '/reports',
      builder: (context, state) => const ReportsScreen(), 
    ),
    GoRoute(
      path: '/poojan',
      builder: (context, state) => const PoojanScreen(),
    ),
    GoRoute(
      path: '/about',
      builder: (context, state) => const AboutScreen(),
    ),
    GoRoute(
      path: '/login', 
      builder: (context, state) => const LoginScreen(),
    ),
  ],
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyDWT7MUirCQe5oqei4hQrS6fh1tklXOpBE",
      authDomain: "astroapp-69373.firebaseapp.com",
      projectId: "astroapp-69373",
      storageBucket: "astroapp-69373.firebasestorage.app",
      messagingSenderId: "971003065246",
      appId: "1:971003065246:web:c6c34acb4054855d3f1c8f",
    ),
  );

  runApp(const AstroApp());
}

class AstroApp extends StatelessWidget {
  const AstroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Astro Arun Pandit Clone',
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
      theme: ThemeData(
        primaryColor: AppColors.deepBrown,
        scaffoldBackgroundColor: AppColors.creamBg,
        textTheme: TextTheme(
          bodyLarge: GoogleFonts.poppins(color: AppColors.deepBrown),
          bodyMedium: GoogleFonts.poppins(color: AppColors.deepBrown),
          bodySmall: GoogleFonts.poppins(color: AppColors.deepBrown),
          displayLarge: GoogleFonts.poppins(color: AppColors.deepBrown),
          displayMedium: GoogleFonts.poppins(color: AppColors.deepBrown),
          displaySmall: GoogleFonts.poppins(color: AppColors.deepBrown),
          headlineLarge: GoogleFonts.poppins(color: AppColors.deepBrown),
          headlineMedium: GoogleFonts.poppins(color: AppColors.deepBrown),
          headlineSmall: GoogleFonts.poppins(color: AppColors.deepBrown),
          titleLarge: GoogleFonts.poppins(color: AppColors.deepBrown),
          titleMedium: GoogleFonts.poppins(color: AppColors.deepBrown), // Fixed here
          titleSmall: GoogleFonts.poppins(color: AppColors.deepBrown),
          labelLarge: GoogleFonts.poppins(color: AppColors.deepBrown),
          labelMedium: GoogleFonts.poppins(color: AppColors.deepBrown),
          labelSmall: GoogleFonts.poppins(color: AppColors.deepBrown),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.deepBrown,
          secondary: AppColors.warmGold,
        ),
        useMaterial3: true,
      ),
    );
  }
}
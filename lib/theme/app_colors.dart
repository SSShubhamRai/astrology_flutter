import 'package:flutter/material.dart';

class AppColors {
  // Primary & Background Theme Tokens
  static const Color primaryBrown = Color(0xFF3D1C06);
  static const Color deepBrown = Color(0xFF5B2C0E);
  static const Color warmGold = Color(0xFFD4A373);
  static const Color lightGold = Color(0xFFE9C46A);
  static const Color creamBg = Color(0xFFFDFBF7);
  static const Color cardBg = Color(0xFFF7F2EB);
  static const Color subtitleBrown = Color(0xFF7F4F24);
  static const Color borderBrown = Color(0xFFE6CCB2);

  // Common Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF5B2C0E), Color(0xFF3D1C06)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient goldGradient = LinearGradient(
    colors: [Color(0xFFE9C46A), Color(0xFFD4A373)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
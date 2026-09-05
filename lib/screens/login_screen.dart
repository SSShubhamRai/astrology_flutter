import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../theme/app_colors.dart';
import '../widgets/custom_navbar.dart';
import '../widgets/app_footer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLoading = false;

  // Google Sign-In & Firebase Authentication Function
  Future<void> _handleGoogleSignIn() async {
    setState(() => _isLoading = true);
    try {
      // Trigger Google Sign In flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        setState(() => _isLoading = false);
        return; // User canceled the sign-in
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase with the credential
      await FirebaseAuth.instance.signInWithCredential(credential);

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Google Login Successful! Welcome.')),
      );

      // Redirect to Home Page
      context.go('/');
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login Failed: $e')),
      );
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.creamBg,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomNavbar(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1100),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      bool isWide = constraints.maxWidth > 850;

                      final leftImageWidget = Container(
                        width: isWide ? 440 : double.infinity,
                        height: 580,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: AppColors.warmGold.withValues(alpha: 0.4), width: 1.2),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.08),
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(18),
                          child: Image.asset(
                            'assets/images/login_banner.png',
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: AppColors.primaryBrown,
                                child: const Center(
                                  child: Icon(Icons.temple_hindu, size: 80, color: AppColors.warmGold),
                                ),
                              );
                            },
                          ),
                        ),
                      );

                      final rightFormWidget = SizedBox(
                        width: isWide ? 520 : double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 210,
                              margin: const EdgeInsets.only(bottom: 28),
                              decoration: BoxDecoration(
                                color: AppColors.primaryBrown,
                                borderRadius: BorderRadius.circular(18),
                                border: Border.all(color: AppColors.warmGold.withValues(alpha: 0.5)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.1),
                                    blurRadius: 15,
                                    offset: const Offset(0, 6),
                                  ),
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(17),
                                child: Image.asset(
                                  'assets/images/offer_banner.png',
                                  fit: BoxFit.fill,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Center(
                                      child: Text(
                                        'SIGN UP & GET 50% OFF',
                                        style: GoogleFonts.playfairDisplay(
                                          color: AppColors.lightGold,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(32),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: AppColors.warmGold.withValues(alpha: 0.3)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.05),
                                    blurRadius: 15,
                                    offset: const Offset(0, 6),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Log In or Sign Up',
                                    style: GoogleFonts.playfairDisplay(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primaryBrown,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  const Text(
                                    'Continue quickly and securely with your Google account.',
                                    style: TextStyle(fontSize: 13, color: AppColors.subtitleBrown, height: 1.4),
                                  ),
                                  const SizedBox(height: 32),
                                  
                                  // Google Sign-In Button with Official Google PNG Logo
                                  SizedBox(
                                    width: double.infinity,
                                    child: OutlinedButton.icon(
                                      style: OutlinedButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(vertical: 14),
                                        side: const BorderSide(color: AppColors.borderBrown, width: 1.2),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                        backgroundColor: Colors.white,
                                      ),
                                      onPressed: _isLoading ? null : _handleGoogleSignIn,
                                      icon: _isLoading
                                          ? const SizedBox(
                                              height: 20,
                                              width: 20,
                                              child: CircularProgressIndicator(strokeWidth: 2, color: AppColors.primaryBrown),
                                            )
                                          : Image.network(
                                              'https://www.gstatic.com/images/branding/product/1x/googleg_48dp.png',
                                              height: 22,
                                              width: 22,
                                              errorBuilder: (context, error, stackTrace) => const Icon(Icons.g_mobiledata, size: 28, color: Colors.red),
                                            ),
                                      label: const Text(
                                        'Sign in with Google',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.primaryBrown,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );

                      if (isWide) {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            leftImageWidget,
                            const SizedBox(width: 50),
                            rightFormWidget,
                          ],
                        );
                      } else {
                        return Column(
                          children: [
                            leftImageWidget,
                            const SizedBox(height: 35),
                            rightFormWidget,
                          ],
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
            const AppFooter(),
          ],
        ),
      ),
    );
  }
}
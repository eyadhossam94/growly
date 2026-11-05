import 'package:flutter/material.dart';
import 'package:growly/screen/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    // Animation Controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    // Fade Animation
    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );

    // Up / Slide Animation
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.35),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutCubic,
      ),
    );

    // Start Splash
    _startSplash();
  }

  Future<void> _startSplash() async {
    // تشغيل الأنيميشن
    await _controller.forward();

    // إبقاء اللوجو ظاهرًا قليلًا
    await Future.delayed(
      const Duration(milliseconds: 700),
    );

    if (!mounted) return;

    // الانتقال إلى Home
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const Login(),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,

        // Background
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFFFFFFF),
              Color(0xFFF8F2FF),
              Color(0xFFEBDDFF),
            ],
          ),
        ),

        child: Center(
          child: FadeTransition(
            opacity: _fadeAnimation,

            child: SlideTransition(
              position: _slideAnimation,

              child: Container(
                padding: const EdgeInsets.all(25),

                decoration: BoxDecoration(
                  shape: BoxShape.circle,

                  // Purple Glow
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF8E4DFF).withOpacity(0.18),
                      blurRadius: 70,
                      spreadRadius: 15,
                    ),
                  ],
                ),

                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/Growlyassets/logo2.png',
                        width: 220,
                      ),
                      Text(".ازرع عادة، احصد حياة أفضل",style: TextStyle(color:Colors.deepPurple,fontWeight: FontWeight.bold ),)
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
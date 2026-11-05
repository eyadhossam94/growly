import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:growly/shareed.dart/photo.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "حديقتك",
          style: GoogleFonts.parastoo(
            color: Colors.white,
            fontSize: 27,
            fontWeight: FontWeight.w600,
          ),
        ),
        elevation: 1,
        backgroundColor: const Color.fromARGB(255, 12, 1, 31),
      ),

      backgroundColor: const Color.fromARGB(255, 21, 2, 53),
      body: Column(
        children: [
          ShapeShadowImage(
            assetPath: "assets/Growlyassets/level1.png",
            width: 500,
            blurSigma: 25, // كل ما زاد كل ما الشادو بقى أنعم
            topOffset: 8,
            bottomOffset: 15,
            shadowOpacity: 0.10,
            shadowColor: const Color.fromARGB(
              255,
              2,
              2,
              2,
            ), // ممكن تخليه بلون بدل أسود
          ),
          SizedBox(height: 10),
          Text(
            "يلا يا بطل. اعمل شويه عادات عشان تكبر النبته",
            style: GoogleFonts.handjet(
              color: const Color.fromARGB(179, 255, 255, 255),
              fontSize: 25,
            ),
          ),
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 64,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xFF171833),
                borderRadius: BorderRadius.circular(17),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "المستوى 0",
                        style: TextStyle(
                          color: Color(0xFFD9B7FF),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      Text(
                        "0 / 1200",
                        style: TextStyle(
                          color: Color(0xFFD9B7FF),
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  // Progress
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: LinearProgressIndicator(
                      value: 0 / 1200,
                      minHeight: 8,
                      backgroundColor: const Color(0xFF2A2850),
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        Color(0xFFAA62E8),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 14),

          // =========================
          // Add Habit Button
          // =========================
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17),

                gradient: const LinearGradient(
                  colors: [Color(0xFFFFA6A0), Color(0xFFFFC36B)],
                ),

                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFFFA46F).withOpacity(0.18),
                    blurRadius: 18,
                    spreadRadius: 1,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(17),
                  onTap: () {
                    // Add habit
                  },
                  child: const Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "+",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w400,
                          ),
                        ),

                        SizedBox(width: 10),

                        Text(
                          "إضافة عادة جديدة",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          const Spacer(),

          // =========================
          // Bottom Navigation
          // =========================
        ],
      ),
    );
  }
}

// =====================================================
// Bottom Navigation Item
// =====================================================

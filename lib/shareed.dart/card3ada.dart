import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Card3ada extends StatefulWidget {
  const Card3ada({super.key});

  @override
  State<Card3ada> createState() => _Card3adaState();
}

class _Card3adaState extends State<Card3ada> {
  int add = 0;

  // نخزن IconData وليس Icon
  IconData icon = Icons.add;
  Color iconcolor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: double.infinity,
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: const Color.fromARGB(255, 33, 17, 66),
        ),

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const SizedBox(height: 30),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 💧 أيقونة المياه
                  Container(
                    width: 75,
                    height: 75,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 43, 29, 70),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Icon(
                      Icons.water_drop,
                      color: Colors.blue,
                      size: 40,
                    ),
                  ),

                  const SizedBox(width: 15),

                  // النص + Progress
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "شرب 8 كوب من الماء",
                          style: GoogleFonts.parastoo(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),

                        const SizedBox(height: 6),

                        Text(
                          "$add / 8",
                          style: const TextStyle(
                            color: Color(0xFFD9B7FF),
                            fontSize: 13,
                          ),
                        ),

                        const SizedBox(height: 8),

                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: LinearProgressIndicator(
                            value: add / 8,
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

                  const SizedBox(width: 10),

                  // ➕ / ✅
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (add < 8) {
                          add++;
                        }

                        // عند الوصول إلى 8
                        if (add == 8) {
                          icon = Icons.check_circle;
                          iconcolor = Colors.green;
                        }
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(153, 78, 44, 136),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Icon(icon, color: iconcolor, size: 25),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

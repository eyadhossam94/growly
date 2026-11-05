import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growly/shareed.dart/card3ada.dart';

class Aada extends StatefulWidget {
  const Aada({super.key});

  @override
  State<Aada> createState() => _AadaState();
}

class _AadaState extends State<Aada> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              color: const Color.fromARGB(153, 78, 44, 136),
              borderRadius: BorderRadius.circular(50),
            ),
            child: const Icon(Icons.add, color: Colors.white, size: 25),
          ),
          const SizedBox(width: 15),
        ],
        centerTitle: true,
        title: Text(
          "عاداتي",
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
          Card3ada(),
        ],
      )
    );
  }
}

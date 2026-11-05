import 'package:flutter/material.dart';
import 'package:growly/screen/3ada.dart';
import 'package:growly/screen/home.dart';

class Bottomnavigationbar extends StatefulWidget {
  const Bottomnavigationbar({super.key});

  @override
  State<Bottomnavigationbar> createState() => _BottomnavigationbarState();
}

class _BottomnavigationbarState extends State<Bottomnavigationbar> {
    int selectindex = 0;
  final List<Widget> _page =[
    Home(),
    Aada(),
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        bottomNavigationBar: BottomNavigationBar(
        
        unselectedItemColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 16, 1, 43),
        onTap: (index) {
          setState(() {
            selectindex = index;
          });
        },
        currentIndex: selectindex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.spa, color: Colors.white),
            label: "الحديقه",
          ),
            BottomNavigationBarItem(
            icon: Icon(Icons.track_changes, color: Colors.white),
            label: "عاداتي",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store, color: Colors.white),
            label: "المتجر",
          ),
        
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month, color: Colors.white),
            label: "اليوم",
          ),
        ],
      ),
      body: _page[selectindex],
    );
  }
}
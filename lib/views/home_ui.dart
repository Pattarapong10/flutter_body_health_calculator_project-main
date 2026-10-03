import 'package:flutter/material.dart';
import 'package:flutter_body_health_calculator_project/views/about.dart';
import 'package:flutter_body_health_calculator_project/views/bmi.dart';
import 'package:flutter_body_health_calculator_project/views/bmr.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({super.key});

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  // สร้างตัวแปรเก็บหน้าจอย่อยที่จะมาแสดงที่ body
  // ตัวแบบ List คือ ตัวแปรที่เก็บได้มากกว่า 1 ค่าข้อมูล
  // โดยแต่ละค่าข้อมูลจะมี index number
  List subView = [
    BmiUI(),
    AboutUI(),
    BmrUI(),
  ];

  // สร้างตัวแปรเก็บหมายเลข index ของ item และ ui ที่เลือก
  int? selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ส่วน AppBar()
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text(
          'Body Health Calculator',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      // ส่วนของ BottomNavigationBar()
      bottomNavigationBar: BottomNavigationBar(
        onTap: (paramValue) {
          // โค้ดที่มีต่อการแสดงผลต้องเขียนอยู่ใน setState()
          setState(() {
            selectedIndex = paramValue;
          });
        },
        currentIndex: selectedIndex!,
        selectedItemColor: Colors.deepOrange,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'BMI',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'About',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.heartPulse,
            ),
            label: 'BMR',
          ),
        ],
      ),
      // ส่วนของ body
      body: subView[selectedIndex!],
    );
  }
}

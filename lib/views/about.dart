import 'package:flutter/material.dart';

class AboutUI extends StatelessWidget {
  const AboutUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.22,
            ),
            Text(
              'Body Health Calculator',
              style: TextStyle(
                color: Colors.deepOrange,
                fontSize: MediaQuery.of(context).size.width * 0.075,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.035,
            ),
            Image.asset(
              'assets/images/calculate.png',
              width: MediaQuery.of(context).size.width * 0.4,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            Text(
              'คำนวณค่าดัชนีมวลกาย (BMI)',
              style: TextStyle(
                color: Colors.deepOrange,
                fontSize: MediaQuery.of(context).size.width * 0.04,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'อัตราการเผาผลาญพลังงานพื้นฐาน (BMR)',
              style: TextStyle(
                color: Colors.deepOrange,
                fontSize: MediaQuery.of(context).size.width * 0.04,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: SizedBox(),
            ),
            Image.asset(
              'assets/images/saulogo.png',
              width: MediaQuery.of(context).size.width * 0.15,
            ),
            Text(
              '© 2026 SAU. All rights reserved.',
            ),
            Text(
              'Created by SAU Software Development Team',
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.035,
            ),
          ],
        ),
      ),
    );
  }
}

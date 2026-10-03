// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_body_health_calculator_project/views/home_ui.dart';

class SplashScreenUI extends StatefulWidget {
  const SplashScreenUI({super.key});

  @override
  State<SplashScreenUI> createState() => _SplashScreenUIState();
}

class _SplashScreenUIState extends State<SplashScreenUI> {
  @override
  void initState() {
    // โค้ดคำสั่งหน่วงเวลาเอาไว้ เมื่อครบกำหนดเวลา
    // ให้เปิดไปหน้าจอ HomeUI() แบบย้อนกลับไม่ได้
    Future.delayed(
        //เวลาที่หน่วง
        Duration(
          seconds: 3,
        ),
        //เมื่อครบเวลาแล้วจะให้ทำอะไร
        () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeUI()),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/calculate.png',
              width: MediaQuery.of(context).size.width * 0.55,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.035,
            ),
            Text(
              'Body Health Calculator',
              style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.height * 0.0235,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.045,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.1,
              height: MediaQuery.of(context).size.width * 0.1,
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

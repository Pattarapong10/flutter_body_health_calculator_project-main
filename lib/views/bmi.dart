// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

class BmiUI extends StatefulWidget {
  const BmiUI({super.key});

  @override
  State<BmiUI> createState() => _BmiUIState();
}

class _BmiUIState extends State<BmiUI> {
  // สร้างตัวควบคุม TextField
  TextEditingController _weightCtrl = TextEditingController();
  TextEditingController _heightCtrl = TextEditingController();
  // สร้างตัวแปรสําหรับเก็บค่า BMI กับ การแปรผล
  double _bmi = 0;
  String _result = "การแปรผล";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(55),
          child: Center(
            child: Column(
              children: [
                Text(
                  'คำนวณหาค่าดัชนีมวลกาย (BMI)',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.055,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.025,
                ),
                Image.asset(
                  'assets/images/bmi.png',
                  width: MediaQuery.of(context).size.width * 0.35,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.025,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'น้ำหนัก (kg.)',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.045,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                TextField(
                  controller: _weightCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    hintText: 'กรอกน้ำหนักของคุณ',
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.025,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ส่วนสูง (cm.)',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.045,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                TextField(
                  controller: _heightCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    hintText: 'กรอกส่วนสูงของคุณ',
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.028,
                ),
                ElevatedButton(
                  onPressed: () {
                    // Validate UI ว่าป้อนครบหรือไม่ หากไม่ครบกแสดง MSG เตือน
                    // ตรวจสอบป้อนน้ำหนัก
                    if (_weightCtrl.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('กรุณาป้อนน้ำหนักของคุณ'),
                          backgroundColor: Colors.red,
                          duration: Duration(seconds: 2),
                        ),
                      );
                      return;
                    }
                    // ตรวจสอบป้อนส่วนสูง
                    if (_heightCtrl.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('กรุณาป้อนส่วนสูงของคุณ'),
                          backgroundColor: Colors.red,
                          duration: Duration(seconds: 2),
                        ),
                      );
                      return;
                    }
                    // หลังจากผ่านการ Validate แล้ว คำนวณ BMI และแสดงผล
                    // แปลง String ให้เป็น double
                    double w = double.parse(_weightCtrl.text);
                    double h = double.parse(_heightCtrl.text);
                    // คำนวณ BMI และเอาค่าที่คำนวณได้ไปแสดงผล พร้อมกับแสดงการแปลผลของ BMI ****
                    // *** โค้ดการทำงานใดๆ ก็ตามที่มีผลต่อการแสดงผลบนหน้าจอ ต้องเขียนใต้ setState() ***
                    setState(() {
                      _bmi = w / ((h / 100) * (h / 100));

                      if (_bmi < 18.5) {
                        _result = 'ผอม/น้ำหนักน้อยเกินไป';
                      } else if (_bmi < 22.9) {
                        _result = 'ปกติ';
                      } else if (_bmi < 24.9) {
                        _result = 'น้ำหนักเกิน/ท้วม';
                      } else if (_bmi < 29.9) {
                        _result = 'โรคอ้วนระดับ 1';
                      } else {
                        _result = 'โรคอ้วนระดับ 2';
                      }
                    });
                  },
                  child: Text(
                    'คำนวณ BMI',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.045,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    fixedSize: Size(
                      MediaQuery.of(context).size.width,
                      MediaQuery.of(context).size.height * 0.07,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.015,
                ),
                ElevatedButton(
                  onPressed: () {
                    // ล้างข้อมูล แล้วก็ค่า BMI กลับเป็น 0 แลกการแปรผล
                    setState(() {
                      _weightCtrl.text = '';
                      _heightCtrl.text = '';
                      _bmi = 0;
                      _result = 'การแปรผล';
                    });
                  },
                  child: Text(
                    'ล้างข้อมูล',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.045,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    fixedSize: Size(
                      MediaQuery.of(context).size.width,
                      MediaQuery.of(context).size.height * 0.07,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.025,
                ),
                // แสดงผล BMI
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.18,
                  child: Container(
                    color: Colors.green[100],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'BMI',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.045,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          _bmi.toStringAsFixed(2),
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.1,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrange,
                          ),
                        ),
                        Text(
                          _result,
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.045,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

class BmrUI extends StatefulWidget {
  const BmrUI({super.key});

  @override
  State<BmrUI> createState() => _BmrUIState();
}

class _BmrUIState extends State<BmrUI> {
  bool isMale = false; // สร้างตัวแปรเพื่อเก็บค่าเพศ
  double _bmr = 0; // สร้างตัวแปรเพื่อเก็บค่าส่วนสูง

  // สร้างตัวควบคุม TextField
  TextEditingController _weightCtrl = TextEditingController();
  TextEditingController _heightCtrl = TextEditingController();
  TextEditingController _ageCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(55),
          child: Center(
            child: Column(
              children: [
                Text(
                  'คำนวณหาอัตราการเผาผลาญที่',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.055,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'ร่างกายต้องการ (BMR)',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.055,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.026,
                ),
                Image.asset(
                  'assets/images/bmr.png',
                  width: MediaQuery.of(context).size.width * 0.33,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.026,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'เพศ',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.035,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            isMale ? Colors.blue[100] : Colors.white,
                        fixedSize: Size(
                          MediaQuery.of(context).size.width * 0.35,
                          MediaQuery.of(context).size.height * 0.06,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          isMale = true; // กำหนดค่าเพศเป็นชาย
                        });
                      },
                      child: Text(
                        'ชาย',
                        style: TextStyle(
                          color: isMale ? Colors.blue[900] : Colors.black,
                          fontSize: MediaQuery.of(context).size.width * 0.0355,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.044,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            !isMale ? Colors.blue[100] : Colors.white,
                        fixedSize: Size(
                          MediaQuery.of(context).size.width * 0.35,
                          MediaQuery.of(context).size.height * 0.06,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          isMale = false; // กำหนดค่าเพศเป็นหญิง
                        });
                      },
                      child: Text(
                        'หญิง',
                        style: TextStyle(
                          color: !isMale ? Colors.blue[900] : Colors.black,
                          fontSize: MediaQuery.of(context).size.width * 0.0355,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.025,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'น้ำหนัก (kg.)',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.035,
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
                    hintText: 'กรอกน้ำหนักของคุณ',
                    hintStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.035,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ส่วนสูง (cm.)',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.035,
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
                    hintText: 'กรอกส่วนสูงของคุณ',
                    hintStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.035,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'อายุ (ปี)',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.035,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                TextField(
                  controller: _ageCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'กรอกอายุของคุณ',
                    hintStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.035,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                ElevatedButton(
                  onPressed: () {
                    // Validate UI
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
                    // ตรวจสอบป้อนอายุ
                    if (_ageCtrl.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('กรุณาป้อนอายุของคุณ'),
                          backgroundColor: Colors.red,
                          duration: Duration(seconds: 2),
                        ),
                      );
                      return;
                    }
                    // คำนวณ BMR โดยตรวจว่าเป็น ชาย หรือ หญิง เพราะเป็นคนละสูตร
                    // โค้ดที่มีผลต่อการแสดงผลต้องอยู่ภายใต้ setState()
                    setState(() {
                      // แปลงน้ำหนักและส่วนสูงเป็นตัวเลข
                      double w = double.parse(_weightCtrl.text);
                      double h = double.parse(_heightCtrl.text);
                      int a = int.parse(_ageCtrl.text);
                      if (isMale == true) {
                        // คิดสูตรสําหรับชาย
                        _bmr =
                            88.362 + (13.397 * w) + (4.799 * h) - (5.677 * a);
                      } else {
                        // คิดสูตรสําหรับหญิง
                        _bmr =
                            447.593 + (9.247 * w) + (3.098 * h) - (4.330 * a);
                      }
                    });
                  },
                  child: Text(
                    'คำนวณ BMR',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.045,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    fixedSize: Size(
                      MediaQuery.of(context).size.width,
                      MediaQuery.of(context).size.height * 0.06,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.015,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _weightCtrl.clear();
                      _heightCtrl.clear();
                      _ageCtrl.clear();
                      _bmr = 0.0;
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
                    backgroundColor: Colors.grey[400],
                    fixedSize: Size(
                      MediaQuery.of(context).size.width,
                      MediaQuery.of(context).size.height * 0.06,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.025,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.18,
                  child: Container(
                    color: Colors.green[100],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'BMR',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.045,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          _bmr.toStringAsFixed(2),
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.1,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrange,
                          ),
                        ),
                        Text(
                          'kcal/day',
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

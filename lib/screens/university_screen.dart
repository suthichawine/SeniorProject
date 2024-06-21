// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class UniversityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 200, // ปรับความสูงตามต้องการ
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/ksu1.jpg'), // เปลี่ยนเป็นรูปภาพของมหาวิทยาลัยกาฬสินธุ์
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'มหาวิทยาลัยกาฬสินธุ์',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'ที่อยู่: 62 หมู่ 5 ตำบลกาฬสินธุ์ อำเภอเมืองกาฬสินธุ์ จังหวัดกาฬสินธุ์ 46000',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'รายละเอียด:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'มหาวิทยาลัยกาฬสินธุ์ เป็นมหาวิทยาลัยที่มุ่งเน้นการพัฒนาท้องถิ่นและการสร้างสรรค์ความรู้ใหม่ ๆ เพื่อตอบสนองความต้องการของชุมชนและสังคม มีหลักสูตรการศึกษาในหลากหลายสาขาวิชา รวมถึงการวิจัยและพัฒนาในด้านต่าง ๆ',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'หลักสูตรที่เปิดสอน:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    '- คณะศึกษาศาสตร์และนวัตกรรมการศึกษา\n- คณะศิลปศาสตร์\n- คณะวิศวกรรมศาสตร์และเทคโนโลยีอุตสาหกรรม\n- คณะวิทยาศาสตร์และเทคโนโลยีสุขภาพ\n- คณะเทคโนโลยีการเกษตร\n- คณะบริหารศาสตร์',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

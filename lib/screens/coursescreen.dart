import 'package:flutter/material.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          CourseCard(
            title: 'หลักสูตรปริญญาตรี 4 ปี',
            description: 'เรียนรู้เกี่ยวกับการพัฒนาโปรแกรมและเทคโนโลยีสารสนเทศ',
          ),
          CourseCard(
            title: 'หลักสูตรปริญญาตรีเทียบโอน หรือต่อเนื่อง 2-3 ปี',
            description: 'เรียนรู้เกี่ยวกับการจัดการและการตลาดในยุคใหม่',
          ),
          CourseCard(
            title: 'หลักสูตรประกาศนียบัตรวิชาชีพขั้นสูง',
            description: 'เรียนรู้เกี่ยวกับการจัดการและการตลาดในยุคใหม่',
          ),
          CourseCard(
            title: 'หลักสูตรปริญญาโท',
            description: 'เรียนรู้เกี่ยวกับการจัดการและการตลาดในยุคใหม่',
          ),
          CourseCard(
            title: 'หลักสูตรปริญญาเอก',
            description: 'เรียนรู้เกี่ยวกับการจัดการและการตลาดในยุคใหม่',
          ),
          // เพิ่มหลักสูตรอื่นๆ ตามต้องการ
        ],
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  final String title;
  final String description;

  const CourseCard({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue[200],
      elevation: 5.0,
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5.0),
            Text(
              description,
              style: const TextStyle(
                fontSize: 16.0,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 5.0),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(8.0), // ปรับขอบมนที่นี่
                  ),
                ),
                child: const Text(
                  'อ่านเพิ่มเติม',
                  style: TextStyle(color: Colors.black), // สีข้อความปุ่ม
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

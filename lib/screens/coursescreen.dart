import 'package:flutter/material.dart';

class CourseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(18.0),
        children: [
          CourseCard(
            title: 'หลักสูตรปริญญาตรี 4 ปี',
            description: 'เรียนรู้เกี่ยวกับการพัฒนาโปรแกรมและเทคโนโลยีสารสนเทศ',
          ),
          CourseCard(
            title: 'หลักสูตรบริหารธุรกิจ',
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

  CourseCard({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      margin: EdgeInsets.symmetric(vertical: 4.0),
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 2.0),
            Text(
              description,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 2.0),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {},
                child: Text('อ่านเพิ่มเติม'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: CourseScreen(),
  ));
}

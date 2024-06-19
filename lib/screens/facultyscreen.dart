import 'package:flutter/material.dart';

class FacultyScreen extends StatelessWidget {
  // Example list of faculties
  final List<Map<String, String>> faculties = [
    {
      'title': 'คณะศึกษาศาสตร์และนวัตกรรมการศึกษา',
      'description': 'Offers various engineering programs.'
    },
    {
      'title': 'คณะศิลปศาสตร์',
      'description': 'Provides education in business and management.'
    },
    {
      'title': 'คณะวิศวกรรมศาสตร์และเทคโนโลยีอุตสาหกรรม',
      'description': 'Provides education in business and management.'
    },
    {
      'title': 'คณะวิทยาศาสตร์และเทคโนโลยีสุขภาพ',
      'description': 'Provides education in business and management.'
    },
    {
      'title': 'คณะเทคโนโลยีการเกษตร',
      'description': 'Provides education in business and management.'
    },
    {
      'title': 'คณะบริหารศาสตร์',
      'description': 'Provides education in business and management.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: faculties.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(14.0),
            child: ListTile(
              title: Text(faculties[index]['title']!),
              subtitle: Text(faculties[index]['description']!),
            ),
          );
        },
      ),
    );
  }
}

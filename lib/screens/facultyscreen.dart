import 'package:flutter/material.dart';

class FacultyScreen extends StatelessWidget {
  // Example list of faculties with image paths
  final List<Map<String, String>> faculties = [
    {
      'title': 'คณะวิศวกรรมศาสตร์และเทคโนโลยีอุตสาหกรรม',
      'description': 'Provides education in business and management.',
      'image': 'assets/images/engineering.png'
    },
    {
      'title': 'คณะวิทยาศาสตร์และเทคโนโลยีสุขภาพ',
      'description': 'Provides education in business and management.',
      'image': 'assets/images/science.png'
    },
    {
      'title': 'คณะเทคโนโลยีการเกษตร',
      'description': 'Provides education in business and management.',
      'image': 'assets/images/agriculture.png'
    },
    {
      'title': 'คณะบริหารศาสตร์',
      'description': 'Provides education in business and management.',
      'image': 'assets/images/management.png'
    },
    {
      'title': 'คณะศิลปศาสตร์',
      'description': 'Provides education in business and management.',
      'image': 'assets/images/art.png'
    },
    {
      'title': 'คณะศึกษาศาสตร์',
      'description': 'Provides education in business and management.',
      'image': 'assets/images/Education.jpg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: faculties.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: Card(
              color: Colors.lightBlue[50], // Set the card color
              shadowColor: Colors.lightBlueAccent, // Set the shadow color
              elevation: 3, // Set the elevation
              margin: EdgeInsets.all(3.0),
              child: ListTile(
                leading: Image.asset(
                  faculties[index]['image']!,
                  width: 50,
                  height: 50,
                ),
                title: Text(faculties[index]['title']!),
                subtitle: Text(faculties[index]['description']!),
              ),
            ),
          );
        },
      ),
    );
  }
}

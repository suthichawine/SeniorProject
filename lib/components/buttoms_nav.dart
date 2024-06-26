import 'package:flutter/material.dart';
// import 'package:seniorproject/screens/coursescreen.dart';
import 'package:seniorproject/screens/facultyscreen.dart';
import 'package:seniorproject/screens/university_screen.dart';

class BottomsNav extends StatefulWidget {
  const BottomsNav({super.key});

  @override
  State<BottomsNav> createState() => _BottomsNavState();
}

class _BottomsNavState extends State<BottomsNav> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> _widgetOptions = <Widget>[
    UniversityScreen(),
    UniversityScreen(),
    FacultyScreen(),
    // CourseScreen(),
  ];
  // Text(
  //   'Index 0: Home',
  //   style: optionStyle,
  // ),
  // Text(
  //   'Index 1: Business',
  //   style: optionStyle,
  // ),
  // Text(
  //   'Index 2: School',
  //   style: optionStyle,
  // ),
  final List<String> _titles = [
    "Home",
    "University",
    "Faculty",
    // "Course",
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _titles[_selectedIndex],
          style: optionStyle,
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'หน้าหลัก',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance),
            label: 'มหาวิทยาลัย',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'คณะ',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.book),
          //   label: 'หลักสูตร',
          // ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

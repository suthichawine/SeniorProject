import 'package:flutter/material.dart';
// import 'package:seniorproject/screens/course_screen.dart';
import 'package:seniorproject/screens/faculty_screen.dart';
import 'package:seniorproject/screens/university_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    UniversityScreen(),
    FacultyScreen(),
  ];

  final List<String> _titles = [
    "Home",
    "University",
    "Faculty",
    "Course",
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
        title: Text(_titles[_selectedIndex]),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/images/ksu1.jpg'), // เปลี่ยนเป็นรูปภาพที่ต้องการ
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
        ],
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
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'หลักสูตร',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black87,
        unselectedItemColor: Colors.lightBlue,
        selectedLabelStyle: TextStyle(color: Colors.black87),
        unselectedLabelStyle: TextStyle(color: Colors.black),
        onTap: _onItemTapped,
      ),
    );
  }
}

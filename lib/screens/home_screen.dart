import 'package:flutter/material.dart';
import 'package:seniorproject/screens/faculty_screen.dart';
import 'package:seniorproject/screens/home_screen.dart'; // Assuming HomeScreen is a separate screen

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 1; // Index 1 for University

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
      // appBar: AppBar(
      //   title: Text(_titles[_selectedIndex]),
      // ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/ksu1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Text(
              'Welcome to University Screen',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ],
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'หน้าหลัก',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.account_balance),
      //       label: 'มหาวิทยาลัย',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.group),
      //       label: 'คณะ',
      //     ),
      //   ],
      //   currentIndex: _selectedIndex,
      //   selectedItemColor: Colors.black87,
      //   unselectedItemColor: Colors.lightBlue,
      //   selectedLabelStyle: TextStyle(color: Colors.black87),
      //   unselectedLabelStyle: TextStyle(color: Colors.black),
      //   onTap: _onItemTapped,
      // ),
    );
  }
}

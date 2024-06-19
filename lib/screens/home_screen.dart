import 'package:flutter/material.dart';
import 'package:seniorproject/screens/coursescreen.dart';
import 'package:seniorproject/screens/facultyscreen.dart';
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
    UniversityScreen(),
    UniversityScreen(),
    FacultyScreen(),
    CourseScreen(),
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
      // drawer: Drawer(
      //   child: ListView(
      //     padding: EdgeInsets.zero,
      //     children: <Widget>[
      //       // DrawerHeader(
      //       //   decoration: BoxDecoration(
      //       //     color: Colors.lightBlue,
      //       //   ),
      //       //   child: Text(
      //       //     'เมนูหลัก',
      //       //     style: TextStyle(
      //       //       color: Colors.white,
      //       //       fontSize: 24,
      //       //     ),
      //       //   ),
      //       // ),
      //       ListTile(
      //         leading: Icon(Icons.home),
      //         title: Text('หน้าหลัก'),
      //         onTap: () {
      //           Navigator.pop(context);
      //           _onItemTapped(0);
      //         },
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.account_balance),
      //         title: Text('มหาวิทยาลัย'),
      //         onTap: () {
      //           Navigator.pop(context);
      //           _onItemTapped(1);
      //         },
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.group),
      //         title: Text('คณะ'),
      //         onTap: () {
      //           Navigator.pop(context);
      //           _onItemTapped(2);
      //         },
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.book),
      //         title: Text('หลักสูตร'),
      //         onTap: () {
      //           // Navigator.pop(context);
      //           _onItemTapped(3);
      //         },
      //       ),
      //     ],
      //   ),
      )
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
        unselectedItemColor:
            Colors.lightBlue, // สีของไอคอนและข้อความเมื่อไม่ถูกเลือก
        selectedLabelStyle:
            TextStyle(color: Colors.black87), // สีของข้อความเมื่อถูกเลือก
        unselectedLabelStyle:
            TextStyle(color: Colors.black), // สีของข้อความเมื่อไม่ถูกเลือก
        onTap: _onItemTapped,
      ),
    );
  }
}

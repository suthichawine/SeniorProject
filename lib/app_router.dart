import 'package:flutter/material.dart';
import 'package:seniorproject/components/buttoms_nav.dart';
// import 'package:seniorproject/screens/course_screen.dart';
import 'package:seniorproject/screens/department_screen.dart';
import 'package:seniorproject/screens/faculty_screen.dart';
import 'package:seniorproject/screens/home_screen.dart';
import 'package:seniorproject/screens/university_screen.dart';
import 'package:seniorproject/screens/welcome_screen.dart';

class AppRouter {
  // Router Map Key
  static const String welcome = 'welcome';
  static const String university = 'university';
  static const String faculty = 'faculty';
  static const String department = 'department';
  static const String course = 'course';
  static const String home = 'home';
  static const String bottomsNav = 'bottomsNav';



  // Router Map
  static Map<String, WidgetBuilder> get routes => {
        welcome: (context) =>   WelcomeScreen(),
        university: (context) => UniversityScreen(),
        home: (context) => const HomeScreen(),
        bottomsNav: (context) => const BottomsNav(),

        faculty: (context) => FacultyScreen(),
        department: (context) {
          final args = ModalRoute.of(context)!.settings.arguments as String;
          return DepartmentScreen(message: args);
        },
      };
}
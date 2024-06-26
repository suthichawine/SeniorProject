import 'package:flutter/material.dart';
import 'package:seniorproject/screens/department_screen.dart';
import 'package:seniorproject/screens/facultyscreen.dart';
import 'package:seniorproject/screens/university_screen.dart';
import 'package:seniorproject/screens/welcome_screen.dart';

class AppRouter {
  // Router Map Key
  static const String welcome = 'welcome';
  static const String university = 'university';
  static const String faculty = 'faculty';
  static const String department = 'department';

  // Router Map
  static Map<String, WidgetBuilder> get routes => {
        welcome: (context) => const WelcomeScreen(),
        university: (context) => UniversityScreen(),
        faculty: (context) => FacultyScreen(),
        department: (context) {
          final args = ModalRoute.of(context)!.settings.arguments as String;
          return DepartmentScreen(message: args);
        },
      };
}

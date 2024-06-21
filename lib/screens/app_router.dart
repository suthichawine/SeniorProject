import 'dart:js';

// import 'package:seniorproject/screens/coursescreen.dart';
import 'package:seniorproject/screens/facultyscreen.dart';
import 'package:seniorproject/screens/university_screen.dart';
import 'package:seniorproject/screens/welcome_screen.dart';

class AppRouter {

  // Router Map Key
  static const String welcome = 'welcome';
  static const String home = 'home';
  static const String university = 'university';
  static const String faculty = 'faculty';
  static const String course = 'course';

  // static const String register = 'register';
  // static const String forgotPassword = 'forgotPassword';

  // Router Map
  static get routes => {
    welcome: (context) => WelcomeScreen(),
    // home: (context) => HomeScreen(),
    university: (context) => UniversityScreen(),
    faculty: (context) => FacultyScreen(),
    // course: (context) => CourseScreen(),
    // register: (context) => RegisterScreen(),
  };

}
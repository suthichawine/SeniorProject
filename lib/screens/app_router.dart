

import 'package:seniorproject/screens/login_screen.dart';
import 'package:seniorproject/screens/welcome_screen.dart';

class AppRouter {

  // Router Map Key
  static const String welcome = 'welcome';
  static const String login = 'login';
  static const String register = 'register';
  static const String forgotPassword = 'forgotPassword';

  // Router Map
  static get routes => {
    welcome: (context) => WelcomeScreen(),
    login: (context) => LoginScreen(),
    // register: (context) => RegisterScreen(),
  };

}
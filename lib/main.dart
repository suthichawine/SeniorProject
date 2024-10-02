import 'package:flutter/material.dart';
import 'package:get/get.dart'; // เพิ่มการ import GetX
import 'package:seniorproject/app_router.dart';
import 'package:seniorproject/themes/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp( // เปลี่ยนเป็น GetMaterialApp
      debugShowCheckedModeBanner: false, 
      theme: AppTheme.lightTheme,
      routes: AppRouter.routes,
      initialRoute: AppRouter.welcome,
    );
  }
}

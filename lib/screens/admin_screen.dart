// import 'package:flutter/material.dart';
// import 'package:seniorproject/services/user_service.dart';

// class AdminLoginScreen extends StatefulWidget {
//   @override
//   _AdminLoginScreenState createState() => _AdminLoginScreenState();
// }

// class _AdminLoginScreenState extends State<AdminLoginScreen> {
//   final TextEditingController _passwordController = TextEditingController();
//   final String _adminPassword = "admin123"; // รหัสผ่านที่ตั้งไว้
//   final UserService _userService = UserService();

//   Future<void> _login() async {
//     String uid = "someUID"; // UID ของผู้ใช้ (จากการ Authentication)
//     var userData = await _userService.getUserRole(uid);

//     if (userData != null && userData['role'] == 'admin') {
//       if (_passwordController.text == _adminPassword) {
//         Navigator.pushNamed(context, '/adminDashboard'); // ไปที่หน้า Admin
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//           content: Text('รหัสผ่านไม่ถูกต้อง'),
//         ));
//       }
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('คุณไม่มีสิทธิ์เข้าถึง'),
//       ));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Admin Login')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _passwordController,
//               decoration: InputDecoration(labelText: 'รหัสผ่าน'),
//               obscureText: true,
//             ),
//             ElevatedButton(
//               onPressed: _login,
//               child: Text('เข้าสู่ระบบ'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

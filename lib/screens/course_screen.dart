// import 'package:flutter/material.dart';
// import 'package:seniorproject/services/department_service.dart';
// import 'package:seniorproject/models/plo_model.dart'; // นำเข้าโมเดล PLO

// class CourseScreen extends StatelessWidget {
//   final String departmentId;

//   CourseScreen({Key? key, required this.departmentId}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final departmentService = DepartmentService();

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Program Learning Outcomes'),
//       ),
//       body: FutureBuilder<List<PLO>>(
//         future: departmentService.getPLOs(departmentId),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (snapshot.hasData) {
//             final plos = snapshot.data!;
//             return ListView.builder(
//               itemCount: plos.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(plos[index].name),
//                   subtitle: Text(plos[index].description),
//                 );
//               },
//             );
//           } else {
//             return Center(child: Text('No PLOs found'));
//           }
//         },
//       ),
//     );
//   }
// }

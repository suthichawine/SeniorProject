import 'package:flutter/material.dart';
import 'package:seniorproject/models/department_model.dart';
import 'package:seniorproject/screens/course_screen.dart';
import 'package:seniorproject/services/department_service.dart';

class DepartmentScreen extends StatelessWidget {
  final String message;

  DepartmentScreen({Key? key, required this.message}) : super(key: key);
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    final departmentController = TextEditingController();
    final departmentService = DepartmentService();

    return Scaffold(
      appBar: AppBar(
        title: Text(message),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: departmentController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter your text',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final dep = [
                  "สาขาวิชานวัตกรรมการจัดการเรียนรู้ วิชาเอกวิทยาศาสตร์ทั่วไป",
                  "สาขาวิชานวัตกรรมการจัดการเรียนรู้ วิชาเอกเกษตรศาสตร์",
                  "สาขาวิชานวัตกรรมการจัดการเรียนรู้ วิชาเอกฟิสิกส์",
                  "สาขาวิชานวัตกรรมการจัดการเรียนรู้ วิชาเอกภาษาไทย",
                  "สาขาวิชานวัตกรรมการจัดการเรียนรู้ วิชาเอกคอมพิวเตอร์",
                  "สาขาวิชานวัตกรรมการจัดการเรียนรู้ วิชาเอกการประถมศึกษา",
                  "สาขาวิชานวัตกรรมการจัดการเรียนรู้ วิชาเอกชีววิทยา",
                  "สาขาวิชานวัตกรรมการจัดการเรียนรู้ วิชาเอกสังคมศึกษา",
                  "สาขาวิชานวัตกรรมการจัดการเรียนรู้ วิชาเอกพลศึกษา",
                  "ค.ด.นวัตกรรมการจัดการเรียนรู้",
                  "ค.ม.นวัตกรรมการจัดการเรียนรู้",
                  "ค.ม.บริหารการศึกษา",               
                ];
                dep.forEach((e) {
                  departmentService.create("x40o0D2MOVkcSKUCANny",e);
                  print(e);
                });
              },
              child: Text('Submit'),
            ),
            const SizedBox(height: 16),
            FutureBuilder<List<Department>>(
              future: departmentService.getDepartment(message),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  final departments = snapshot.data!;
                  return Expanded(
                    child: ListView.builder(
                      itemCount: departments.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(departments[index].departmentName),
                        );
                      },
                    ),
                  );
                } else {
                  return Text('No data found');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Expanded(
//   child: GridView.builder(
//     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//       crossAxisCount: 2,
//       mainAxisSpacing: 10.0,
//       crossAxisSpacing: 10.0,
//       childAspectRatio: 1.0,
//     ),
//     itemCount: departments.length,
//     itemBuilder: (context, index) {
//       return Card(
//         child: InkWell(
//           onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => CourseScreen(
//                   department: departments[index],
//                 ),
//               ),
//             );
//           },
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image.asset(
//                 departmentLogo,
//                 width: 80,
//                 height: 80,
//                 fit: BoxFit.cover,
//               ),
//               SizedBox(height: 8),
//               Flexible(
//                 child: Text(
//                   departments[index],
//                   style: TextStyle(fontSize: 16.0),
//                   textAlign: TextAlign.center,
//                   overflow: TextOverflow.ellipsis,
//                   maxLines: 3,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     },
//   ),
// ),

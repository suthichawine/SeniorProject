import 'package:flutter/material.dart';
import 'package:seniorproject/screens/course_screen.dart';
import 'package:seniorproject/services/department_service.dart';

class DepartmentScreen extends StatelessWidget {
  final String message;

  DepartmentScreen({Key? key, required this.message}) : super(key: key);
  final TextEditingController _controller = TextEditingController();

  final List<String> departments = [
    'สาขาวิศวกรรมเครื่องกล',
    'สาขาวิศวกรรมอุตสาหการและระบบอัติโนมัติ',
    'สาขาวิศวกรรมโลจิสติกส์',
    'สาขาวิศวกรรมคอมพิวเตอร์',
    'สาขาวิศวกรรมเมคคาทรอนิกส์',
    'สาขาวิศวกรรมเครื่องจักรกลเกษตร',
  ];

  final String departmentLogo = 'assets/images/computer.jpg';

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    final departmentController = TextEditingController();

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
                final departmentService = DepartmentService();
                departmentService.create(
                    message, departmentController.text);
                print('ok');
              },
              child: Text('Submit'),
            ),
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
          ],
        ),
      ),
    );
  }
}

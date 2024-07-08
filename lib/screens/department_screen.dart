import 'package:flutter/material.dart';
import 'package:seniorproject/screens/course_screen.dart';

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

    return Scaffold(
      appBar: AppBar(
        title: Text(message),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                width: 250,
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 1.0,
                ),
                itemCount: departments.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CourseScreen(
                              department: departments[index],
                            ),
                          ),
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            departmentLogo,
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 8),
                          Flexible(
                            child: Text(
                              departments[index],
                              style: TextStyle(fontSize: 16.0),
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

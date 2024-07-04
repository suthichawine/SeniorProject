import 'package:flutter/material.dart';

class DepartmentScreen extends StatelessWidget {
  final String message;

  DepartmentScreen({Key? key, required this.message}) : super(key: key);
  final TextEditingController _controller = TextEditingController();

  // Example list of departments
  final List<String> departments = [
    'สาขาวิศวกรรมเครื่องกล',
    'สาขาวิศวกรรมอุตสาหการและระบบอัติโนมัติ',
    'สาขาวิศวกรรมโลจิสติกส์',
    'สาขาวิศวกรรมคอมพิวเตอร์',
    'สาขาวิศวกรรมเมคคาทรอนิกส์',
    'สาขาวิศวกรรมเครื่องจักรกลเกษตร',
  ];

  // Use the same image for all departments
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
                // child: TextField(
                //   controller: _controller,
                //   obscureText: false,
                //   decoration: InputDecoration(
                //     border: OutlineInputBorder(),
                //     labelText: 'ค้นหาสาขา',
                //   ),
                // ),
              ),
            ),
            // Center(
            //   child: ElevatedButton(
            //     style: style,
            //     onPressed: () {
            //       print(_controller.text);
            //       // Implement search functionality here
            //     },
            //     child: const Text('ค้นหา'),
            //   ),
            // ),
            SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // ตั้งค่าจำนวนคอลัมน์เป็น 2
                  mainAxisSpacing: 10.0, // ตั้งค่าช่องว่างระหว่างแถว
                  crossAxisSpacing: 10.0, // ตั้งค่าช่องว่างระหว่างคอลัมน์
                  childAspectRatio:
                      1.0, // ตั้งค่าอัตราส่วนของ item // อัตราส่วนของขนาดของกล่องสี่เหลี่ยมใน GridView
                ),
                itemCount: departments.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: InkWell(
                      onTap: () {
                        // Handle tapping on each department item
                        print('Selected department: ${departments[index]}');
                        // Navigate to department details or perform action
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

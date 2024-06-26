import 'package:flutter/material.dart';

class UniversityScreen extends StatelessWidget {
  const UniversityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> imagePaths = [
      'assets/images/ksu1.jpg',
      'assets/images/ksu1.jpg',
      'assets/images/ksu1.jpg',
      'assets/images/ksu1.jpg',
      'assets/images/ksu1.jpg',
      'assets/images/ksu1.jpg',
      'assets/images/ksu1.jpg',
      'assets/images/ksu1.jpg',
      'assets/images/ksu1.jpg',
      'assets/images/ksu1.jpg',
    ];

    final List<Map<String, String>> faculties = [
      {
        'title': 'คณะวิศวกรรมศาสตร์และเทคโนโลยีอุตสาหกรรม',
        'description': 'Provides education in business and management.',
        'image': 'assets/images/engineering.png'
      },
      {
        'title': 'คณะวิทยาศาสตร์และเทคโนโลยีสุขภาพ',
        'description': 'Provides education in business and management.',
        'image': 'assets/images/science.png'
      },
    ];

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                search(),
                const SizedBox(height: 20),
                images(imagePaths),
                department(imagePaths),
                const SizedBox(height: 20),
                Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Card(
                        color: Colors.lightBlue[20], // ตั้งค่าสีของ card
                        shadowColor: Colors.black87, // ตั้งค่าสีเงา
                        elevation: 3, // ตั้งค่า elevation
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width *
                              0.462, // กำหนดความกว้างเป็น 50% ของความกว้างหน้าจอ
                          height: MediaQuery.of(context).size.width *
                              0.4, // กำหนดความสูงเท่ากับความกว้างเพื่อให้เป็นสี่เหลี่ยมจตุรัส
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset(
                              "assets/images/science.png",
                              fit: BoxFit.cover, // ให้รูปภาพกรอบที่มี
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Card(
                        color: Colors.lightBlue[20], // ตั้งค่าสีของ card
                        shadowColor: Colors.black87, // ตั้งค่าสีเงา
                        elevation: 3, // ตั้งค่า elevation
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width *
                              0.462, // กำหนดความกว้างเป็น 50% ของความกว้างหน้าจอ
                          height: MediaQuery.of(context).size.width *
                              0.4, // กำหนดความสูงเท่ากับความกว้างเพื่อให้เป็นสี่เหลี่ยมจตุรัส
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset(
                              "assets/images/science.png",
                              fit: BoxFit.cover, // ให้รูปภาพกรอบที่มี
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget department(List<String> imagePaths) {
    return Column(
      children: [
        Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text("สาขาวิชา"),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                ),
                onPressed: () {},
                child: const Text('ดูเพิ่มเติม'),
              ),
            ),
          ],
        ),
        SizedBox(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start, // ชิดด้านบน
              children: imagePaths.map((path) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  width: 80,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    // เพิ่ม decoration อื่น ๆ ตามต้องการ
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      path,
                      fit: BoxFit.cover,
                      width: 80,
                      height: 80,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }

  Widget search() {
    return SearchAnchor(
      builder: (BuildContext context, SearchController controller) {
        return SearchBar(
          controller: controller,
          padding: const MaterialStatePropertyAll<EdgeInsets>(
            EdgeInsets.symmetric(horizontal: 16.0),
          ),
          onTap: () {
            controller.openView();
          },
          onChanged: (_) {
            controller.openView();
          },
          leading: const Icon(Icons.search),
          trailing: <Widget>[
            Tooltip(
              message: 'Change brightness mode',
              child: IconButton(
                // isSelected: isDark,
                onPressed: () {
                  // setState(() {
                  //   isDark = !isDark;
                  // });
                },
                icon: const Icon(Icons.wb_sunny_outlined),
                selectedIcon: const Icon(Icons.brightness_2_outlined),
              ),
            )
          ],
        );
      },
      suggestionsBuilder: (BuildContext context, SearchController controller) {
        return List<ListTile>.generate(
          5,
          (int index) {
            final String item = 'item $index';
            return ListTile(
              title: Text(item),
              onTap: () {
                // setState(() {
                //   controller.closeView(item);
                // });
              },
            );
          },
        );
      },
    );
  }

  Widget images(List<String> imagePaths) {
    return SizedBox(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start, // ชิดด้านบน
          children: imagePaths.map((path) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  path,
                  fit: BoxFit.cover,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

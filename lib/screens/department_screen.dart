import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DepartmentScreen extends StatefulWidget {
  final String message;

  DepartmentScreen({Key? key, required this.message}) : super(key: key);

  @override
  _DepartmentScreenState createState() => _DepartmentScreenState();
}

class _DepartmentScreenState extends State<DepartmentScreen> {
  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Department'),
    ),
    body: StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('department')
          .where("faculty_id", isEqualTo: widget.message)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasData) {
          var departments = snapshot.data!.docs;

          if (departments.isEmpty) {
            return Center(child: Text('No department found.'));
          }

          // เปลี่ยน ListView เป็น GridView
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // จำนวนคอลัมน์
              childAspectRatio: 1, // อัตราส่วนของขนาด
            ),
            itemCount: departments.length,
            itemBuilder: (context, index) {
              var department = departments[index];
              var departmentName =
                  department['department_name'] ?? 'Unknown Department';


              return Card(
                margin: EdgeInsets.all(20.0),
                elevation: 15,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            PLOScreen(departmentId: department.id),
                      ),
                    );
                  },
                  child: Center(
                    child: ListTile(
                      title: Text(departmentName),
                      // subtitle: Text('Faculty ID: ${department['faculty_id']}'),
                    ),
                  ),
                ),
              );
            },
          );
        }

        return Center(child: Text('No departments found.'));
      },
    ),
  );
}

}

class PLOScreen extends StatefulWidget {
  final String departmentId;

  PLOScreen({Key? key, required this.departmentId}) : super(key: key);

  @override
  _PLOScreenState createState() => _PLOScreenState();
}

class _PLOScreenState extends State<PLOScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('วิศวกรรมคอมพิวเตอร์'),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('department')
            .doc(widget.departmentId)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasData) {
            var department = snapshot.data;

            if (department == null || !department.exists) {
              return Center(child: Text('No department found.'));
            }

            var departmentData = department.data() as Map<String, dynamic>;

            // ตรวจสอบว่ามี 'plos' ในข้อมูลหรือไม่
            var plos = departmentData["plos"];
            if (plos == null || plos.isEmpty) {
              return Center(child: Text('No PLOs found.'));
            }

            // ถ้ามีข้อมูล PLOs แสดงรายการพร้อมหมายเลข
            return ListView.builder(
              itemCount: plos.length,
              itemBuilder: (context, index) {
                // ตรวจสอบว่า plos[index] มีข้อมูลหรือไม่และไม่เป็น null
                var ploEntry = plos[index];
                if (ploEntry == null || !ploEntry.containsKey('PLO')) {
                  return ListTile(title: Text('Unknown PLO'));
                }

                var plo = ploEntry['PLO'] ?? 'Unknown PLO';

                // เพิ่มหมายเลข PLO ตาม index
                return Card(
                  margin: EdgeInsets.all(8.0),
                  elevation: 4,
                  child: ListTile(
                    title: Text('${index + 1}. $plo'),  // ใส่หมายเลข PLO ที่นี่
                    trailing: IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        _showEditDialog(plo, index);
                      },
                    ),
                  ),
                );
              },
            );
          }

          return Center(child: Text('No department found.'));
        },
      ),
    );
  }

  // ฟังก์ชันเพิ่ม PLO
  void _addPLO(String ploText) {
    if (ploText.isNotEmpty) {
      FirebaseFirestore.instance.collection('department').doc(widget.departmentId).set({
        'plos': FieldValue.arrayUnion([{'PLO': ploText}]),
      }, SetOptions(merge: true));
    }
  }

  // ฟังก์ชันลบ PLO
  void _deletePLO(String ploText) {
    FirebaseFirestore.instance.collection('department').doc(widget.departmentId).update({
      'plos': FieldValue.arrayRemove([{'PLO': ploText}]),
    });
  }

  // ฟังก์ชันเปิด Dialog แก้ไข PLO
  void _showEditDialog(String oldPLO, int index) {
    TextEditingController _editController = TextEditingController(text: oldPLO);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit PLO'),
          content: TextField(
            controller: _editController,
            decoration: InputDecoration(labelText: 'PLO'),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                _updatePLO(oldPLO, _editController.text);
              },
              child: Text('Update'),
            ),
          ],
        );
      },
    );
  }

  // ฟังก์ชันอัปเดต PLO
  void _updatePLO(String oldPLO, String newPLO) {
    if (newPLO.isNotEmpty) {
      FirebaseFirestore.instance.collection('department').doc(widget.departmentId).update({
        'plos': FieldValue.arrayRemove([{'PLO': oldPLO}]),
      }).then((_) {
        FirebaseFirestore.instance.collection('department').doc(widget.departmentId).update({
          'plos': FieldValue.arrayUnion([{'PLO': newPLO}]),
        });
      });
    }
  }
}

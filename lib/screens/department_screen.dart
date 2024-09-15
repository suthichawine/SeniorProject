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
        title: Text(widget.message),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('department').where("faculty_id",isEqualTo: widget.message).snapshots(),
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

            return ListView.builder(
              itemCount: departments.length,
              itemBuilder: (context, index) {
                var department = departments[index];
                var departmentName = department['department_name'] ?? 'Unknown Department';

                return Card(
                  margin: EdgeInsets.all(8.0),
                  elevation: 4,
                  child: ListTile(
                    title: Text(departmentName),
                    subtitle: Text('Faculty ID: ${department['faculty_id']}'),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PLOScreen(departmentId: department.id),
                        ),
                      );
                    },
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
  final TextEditingController _controllerPLO = TextEditingController();

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text(widget.departmentId),
    ),
    body: StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance
        .collection('department')
        .doc(widget.departmentId) // Use the departmentId from the widget
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
          var departmentName = departmentData['department_name'] ?? 'Unknown Department';

          // return Text(departmentData["plos"].toString(),style: TextStyle(fontSize: 20),);
          return ListView.builder(
              itemCount: departmentData["plos"].length,
              itemBuilder: (context, index) {
                var plos = departmentData["plos"][index];

                return Card(
                  margin: EdgeInsets.all(8.0),
                  elevation: 4,
                  child: ListTile(
                    title: Text(plos["PLO"]),
                    // subtitle: Text('Faculty ID: ${department['faculty_id']}'),
                    // trailing: Icon(Icons.arrow_forward),
                    // onTap: () {
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => PLOScreen(departmentId: department.id),
                    //     ),
                    //   );
                    // },
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


  void _addPLO(String ploText) {
    FirebaseFirestore.instance
        .collection('department')
        .doc(widget.departmentId)
        .set({
      'plos': FieldValue.arrayUnion([
        {'PLO': ploText}
      ]),
    }, SetOptions(merge: true));
  }

  void _deletePLO(String ploText) {
    FirebaseFirestore.instance
        .collection('department')
        .doc(widget.departmentId)
        .update({
      'plos': FieldValue.arrayRemove([
        {'PLO': ploText}
      ]),
    });
  }

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

  void _updatePLO(String oldPLO, String newPLO) {
    if (newPLO.isNotEmpty) {
      FirebaseFirestore.instance
          .collection('department')
          .doc(widget.departmentId)
          .update({
        'plos': FieldValue.arrayRemove([
          {'PLO': oldPLO}
        ]),
      }).then((_) {
        FirebaseFirestore.instance
            .collection('department')
            .doc(widget.departmentId)
            .update({
          'plos': FieldValue.arrayUnion([
            {'PLO': newPLO}
          ]),
        });
      });
    }
  }
}

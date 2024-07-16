import 'package:cloud_firestore/cloud_firestore.dart';

class DepartmentService {
  final CollectionReference course =
      FirebaseFirestore.instance.collection('department');

  Future<void> create(String facultyId, String departmentName) {
    return course.add({
      "faculty_id": facultyId,
      "department_name": departmentName,
    });
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:seniorproject/models/department_model.dart';


class DepartmentController extends GetxController {
  var departments = <dynamic>[].obs;
  var isLoading = true.obs;

  final CollectionReference firebase =
      FirebaseFirestore.instance.collection('department');

  Future<void> fetch(String id) async {
    try {
      QuerySnapshot querySnapshot =
          await firebase.where('faculty_id', isEqualTo: id).get();

      List<Department> result = querySnapshot.docs.map((doc) {
        return Department(
          id: doc.id,
          departmentName: doc["department_name"],
          facultyId: doc["faculty_id"],
          plos: (doc["plos"] as List<dynamic>)
              .map((plo) => Plo.fromJson(plo as Map<String, dynamic>))
              .toList(),
        );
      }).toList();

      departments.assignAll(result);
    } finally {
      isLoading(false);
    }
  }
}

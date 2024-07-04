import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:seniorproject/models/faculty_model.dart';

class FacultyService {
  final CollectionReference faculty =
      FirebaseFirestore.instance.collection('faculty');

 

  Future<List<Faculty>> getAllFaculties() async {
    try {
      QuerySnapshot querySnapshot = await faculty.get();
      List<Faculty> faculties = querySnapshot.docs.map((doc) {
        return Faculty(
          id: doc.id,
          department: doc["department"],
        );
      }).toList();
      return faculties;
    } catch (e) {
      print("Error getting faculties: $e");
      return [];
    }
  }
}



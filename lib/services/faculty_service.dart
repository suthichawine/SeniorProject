import 'package:cloud_firestore/cloud_firestore.dart';

class FacultyService {

  final CollectionReference  faculty = FirebaseFirestore.instance.collection('faculty');

  Future<void> create(String dep) {
    return faculty.add({
      "department": dep,
    });
    // return;
  }
}

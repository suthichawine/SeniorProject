import 'package:get/get.dart';
import 'package:seniorproject/models/faculty_model.dart';
import 'package:seniorproject/services/faculty_service.dart';

class FacultyController extends GetxController {
  var faculties = <Faculty>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchFaculties();
  }

  Future<void> fetchFaculties() async {
    try {
      isLoading(true);
      // await Future.delayed(const Duration(seconds: 3));
      var fetchedFaculties = await FacultyService().getAllFaculties();
      faculties.assignAll(fetchedFaculties);
    } finally {
      isLoading(false);
    }
  }
}

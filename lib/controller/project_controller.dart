import 'package:get/get.dart';

class ProjectController extends GetxController {
  var donation = 0.obs;
  void donate() {
    for (var i = 0; i < 1; i++) {
      if (int.parse(donation.toString()) != 100) {
        donation += 5;
      }
    }
  }
}

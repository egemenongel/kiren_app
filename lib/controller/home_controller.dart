import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../views/projects/project_model.dart';

class HomeController extends GetxController {
  TextEditingController searchText = TextEditingController();
  late final projectList = [
    ProjectModel(
      title: "Project 1",
      donation: 0.obs,
    ),
    ProjectModel(
      title: "Project 2",
      donation: 0.obs,
    ),
    ProjectModel(
      title: "Project 3",
      donation: 0.obs,
    ),
    ProjectModel(
      title: "Project 4",
      donation: 0.obs,
    ),
    ProjectModel(
      title: "Project 5",
      donation: 0.obs,
    )
  ].obs;
  void donate(ProjectModel projectModel) {
    if (int.parse(projectModel.donation.toString()) != 100) {
      projectModel.donation += 5;
    }
  }
}

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../views/projects/project_model.dart';

class HomeController extends GetxController {
  TextEditingController searchText = TextEditingController();
  final projectList = [
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

  late List suggestionList = searchText.text.isNotEmpty
      ? projectList
          .where((element) =>
              element.title.startsWith(searchText.text) ||
              element.title.startsWith(searchText.text.capitalizeFirst!) ||
              element.title.contains(searchText.text))
          .toList()
          .obs
      : [];
}

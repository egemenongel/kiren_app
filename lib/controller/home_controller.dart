import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kiren_app/views/projects/project_model.dart';

class HomeController extends GetxController {
  TextEditingController searchText = TextEditingController();
  late final projectList = [
    ProjectModel(title: "Project 1", donation: 0),
    ProjectModel(title: "Project 2", donation: 0),
    ProjectModel(title: "Project 3", donation: 0),
    ProjectModel(title: "Project 4", donation: 0),
    ProjectModel(title: "Project 5", donation: 0)
  ];
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiren_app/helper/size_helper.dart';
import 'package:kiren_app/controller/home_controller.dart';
import 'package:kiren_app/views/projects/project_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_vert,
                )),
          ),
        ],
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back,
            ),
            onPressed: () => Get.back(),
          ),
        ),
      ),
      body: Stack(
        children: [
          SizedBox(
            height: displayHeight(context),
            child: Column(
              children: [
                buildHeader(context),
                Expanded(
                  child: Container(
                      padding: mediumHorizontalPadding(context),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Spacer(flex: 18),
                          Expanded(
                            flex: 6,
                            child: FittedBox(
                              child: Text(
                                "Featured & recommended",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Get.theme.colorScheme.onBackground,
                                ),
                              ),
                            ),
                          ),
                          const Spacer(
                            flex: 5,
                          ),
                          Expanded(
                            flex: 100,
                            child: homeController.searchText.text.isEmpty
                                ? buildProjects(context)
                                : buildSuggestions(context),
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
          Positioned(
            child: buildSearchBar(context),
            top: 275,
            width: displayWidth(context),
          ),
        ],
      ),
      bottomNavigationBar: buildNavBar(context),
    );
  }

  Widget buildHeader(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/Asset 1.png"),
                fit: BoxFit.cover,
              )),
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(
                    flex: 24,
                  ),
                  Expanded(
                    flex: 11,
                    child: FittedBox(
                      child: Text(
                        "Transformation \n of new ideas",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Get.theme.colorScheme.primary,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(
                    flex: 8,
                  ),
                ],
              ),
              height: displayHeight(context) * 0.39),
        ),
      ],
    );
  }

  Widget buildSearchBar(BuildContext context) {
    final homeController = Get.put(HomeController());
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 60.0),
      child: TextField(
        controller: homeController.searchText,
        decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xffffffff),
            prefixIcon: const Icon(
              Icons.search,
              color: Color(0xffB986EF),
            ),
            hintStyle: const TextStyle(
              color: Color(0xffDEC5FF),
            ),
            alignLabelWithHint: true,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Get.theme.colorScheme.primaryVariant,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(
                  50.0,
                ))),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Get.theme.colorScheme.secondary,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(
                  50.0,
                ))),
            border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Get.theme.colorScheme.secondary,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    50.0,
                  ),
                ))),
      ),
    );
  }

  Widget buildProjects(BuildContext context) {
    final homeController = Get.put(HomeController());
    return Container(
      width: displayWidth(context),
      decoration: const BoxDecoration(
        color: Color(0xffD3EDD9),
        borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
      ),
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 10),
        itemCount: homeController.projectList.length,
        itemBuilder: (BuildContext context, int index) {
          var projectList = homeController.projectList;
          var projectItem = projectList[index];
          return Padding(
              padding: smallestPadding(context),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(() => (ProjectView(
                            projectItem: projectItem,
                          )));
                    },
                    child: Card(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(
                        20.0,
                      ))),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 90.0,
                              margin: const EdgeInsets.all(10.0),
                              decoration: const BoxDecoration(
                                color: Color(0xff8AE2A3),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                              ),
                            ),
                          ),
                          Expanded(
                              child: Container(
                            height: 90,
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Spacer(),
                                Flexible(
                                  flex: 4,
                                  child: FittedBox(
                                    child: Text(
                                      projectList[index].title,
                                      style: TextStyle(
                                        color: context
                                            .theme.colorScheme.onBackground,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                                const Spacer(
                                  flex: 2,
                                ),
                                Flexible(
                                  flex: 3,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 5,
                                        child: FittedBox(
                                          child: Text(
                                            "Target:",
                                            style: TextStyle(
                                              color: context.theme.colorScheme
                                                  .primaryVariant,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Spacer(
                                        flex: 4,
                                      ),
                                      Expanded(
                                        flex: 4,
                                        child: FittedBox(
                                          child: Text(
                                            "\$5000",
                                            style: TextStyle(
                                              color: context
                                                  .theme.colorScheme.secondary,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Spacer(
                                        flex: 4,
                                      ),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                Flexible(
                                  flex: 3,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 5,
                                        child: FittedBox(
                                          child: Text(
                                            "Pledget:",
                                            style: TextStyle(
                                              color: context.theme.colorScheme
                                                  .primaryVariant,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Spacer(
                                        flex: 4,
                                      ),
                                      Expanded(
                                        flex: 4,
                                        child: FittedBox(
                                          child: Text(
                                            "\$4,500",
                                            style: TextStyle(
                                              color: context
                                                  .theme.colorScheme.secondary,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Spacer(
                                        flex: 4,
                                      ),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                Flexible(
                                  flex: 3,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 5,
                                        child: FittedBox(
                                          child: Text(
                                            "Backers:",
                                            style: TextStyle(
                                              color: context.theme.colorScheme
                                                  .primaryVariant,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Spacer(
                                        flex: 4,
                                      ),
                                      Expanded(
                                        flex: 4,
                                        child: FittedBox(
                                          child: Text(
                                            "46       ",
                                            style: TextStyle(
                                              color: context
                                                  .theme.colorScheme.secondary,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Spacer(
                                        flex: 4,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )),
                          SizedBox(
                              height: 90.0,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    padding: EdgeInsets.zero,
                                    constraints: const BoxConstraints(),
                                    splashRadius: 20,
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.more_vert,
                                    ),
                                    color: const Color(0xffDDDDDD),
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    right: 28,
                    bottom: 95,
                    height: 31,
                    child: CircleAvatar(
                        backgroundColor: Get.theme.colorScheme.secondary,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Spacer(
                              flex: 2,
                            ),
                            Expanded(
                              flex: 5,
                              child: Icon(
                                Icons.star,
                                color: Get.theme.colorScheme.primary,
                                size: 10,
                              ),
                            ),
                            Flexible(
                              flex: 6,
                              child: FittedBox(
                                child: Text(
                                  "4.5",
                                  style: TextStyle(
                                    color: Get.theme.colorScheme.primary,
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(
                              flex: 2,
                            ),
                          ],
                        )),
                  ),
                ],
              ));
        },
      ),
    );
  }

  Widget buildSuggestions(BuildContext context) {
    final homeController = Get.put(HomeController());
    final myList = homeController.searchText.text.isNotEmpty
        ? homeController.projectList
            .where((element) =>
                element.title.startsWith(homeController.searchText.text) ||
                element.title.startsWith(
                    homeController.searchText.text.capitalizeFirst!) ||
                element.title.contains(homeController.searchText.text))
            .toList()
        : [];
    return Container(
        width: displayWidth(context),
        decoration: const BoxDecoration(
          color: Color(0xffD3EDD9),
          borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.only(top: 10),
          itemCount: myList.length,
          itemBuilder: (BuildContext context, int index) {
            var projectItem = myList[index];
            return Padding(
                padding: smallestPadding(context),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(() => ProjectView(
                              projectItem: projectItem,
                            ));
                      },
                      child: Card(
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(
                          20.0,
                        ))),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 90.0,
                                margin: const EdgeInsets.all(10.0),
                                decoration: const BoxDecoration(
                                  color: Color(0xff8AE2A3),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                ),
                              ),
                            ),
                            Expanded(
                                child: Container(
                              height: 90,
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Spacer(),
                                  Flexible(
                                    flex: 4,
                                    child: FittedBox(
                                      child: Text(
                                        myList[index].title,
                                        style: TextStyle(
                                          color: context
                                              .theme.colorScheme.onBackground,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Spacer(
                                    flex: 2,
                                  ),
                                  Flexible(
                                    flex: 3,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 5,
                                          child: FittedBox(
                                            child: Text(
                                              "Target:",
                                              style: TextStyle(
                                                color: context.theme.colorScheme
                                                    .primaryVariant,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const Spacer(
                                          flex: 4,
                                        ),
                                        Expanded(
                                          flex: 4,
                                          child: FittedBox(
                                            child: Text(
                                              "\$5000",
                                              style: TextStyle(
                                                color: context.theme.colorScheme
                                                    .secondary,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const Spacer(
                                          flex: 4,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  Flexible(
                                    flex: 3,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 5,
                                          child: FittedBox(
                                            child: Text(
                                              "Pledget:",
                                              style: TextStyle(
                                                color: context.theme.colorScheme
                                                    .primaryVariant,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const Spacer(
                                          flex: 4,
                                        ),
                                        Expanded(
                                          flex: 4,
                                          child: FittedBox(
                                            child: Text(
                                              "\$4,500",
                                              style: TextStyle(
                                                color: context.theme.colorScheme
                                                    .secondary,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const Spacer(
                                          flex: 4,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  Flexible(
                                    flex: 3,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 5,
                                          child: FittedBox(
                                            child: Text(
                                              "Backers:",
                                              style: TextStyle(
                                                color: context.theme.colorScheme
                                                    .primaryVariant,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const Spacer(
                                          flex: 4,
                                        ),
                                        Expanded(
                                          flex: 4,
                                          child: FittedBox(
                                            child: Text(
                                              "46      ",
                                              style: TextStyle(
                                                color: context.theme.colorScheme
                                                    .secondary,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const Spacer(
                                          flex: 4,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )),
                            SizedBox(
                                height: 90.0,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                      padding: EdgeInsets.zero,
                                      constraints: const BoxConstraints(),
                                      splashRadius: 20,
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.more_vert,
                                      ),
                                      color: const Color(0xffDDDDDD),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      right: 28,
                      bottom: 95,
                      height: 31,
                      child: CircleAvatar(
                          backgroundColor: Get.theme.colorScheme.secondary,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Spacer(
                                flex: 2,
                              ),
                              Expanded(
                                flex: 5,
                                child: Icon(
                                  Icons.star,
                                  color: Get.theme.colorScheme.primary,
                                  size: 10,
                                ),
                              ),
                              Flexible(
                                flex: 6,
                                child: FittedBox(
                                  child: Text(
                                    "4.5",
                                    style: TextStyle(
                                      color: Get.theme.colorScheme.primary,
                                    ),
                                  ),
                                ),
                              ),
                              const Spacer(
                                flex: 2,
                              ),
                            ],
                          )),
                    ),
                  ],
                ));
          },
        ));
  }

  Widget buildNavBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Get.theme.colorScheme.primary,
        border: Border.all(
          color: Get.theme.colorScheme.secondaryVariant,
        ),
      ),
      height: displayHeight(context) * 0.088,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            color: Get.theme.colorScheme.secondary,
            onPressed: () {},
            icon: const Icon(
              Icons.home,
            ),
          ),
          IconButton(
            color: Get.theme.colorScheme.secondary,
            onPressed: () {},
            icon: const Icon(Icons.grid_view_sharp),
          ),
          IconButton(
            color: Get.theme.colorScheme.secondary,
            onPressed: () {},
            icon: const Icon(
              Icons.person,
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiren_app/controller/home_controller.dart';
import 'package:kiren_app/helper/size_helper.dart';
import 'package:kiren_app/views/projects/project_model.dart';

import 'package:kiren_app/controller/project_controller.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ProjectView extends StatelessWidget {
  ProjectView({
    required this.projectItem,
    Key? key,
  }) : super(key: key);
  ProjectModel projectItem;
  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: kToolbarHeight,
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xffB986EF),
        elevation: 0.0,
        actions: [
          Padding(
            padding: smallVerticalPadding(context),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_vert,
                )),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            Expanded(
              flex: 16,
              child: buildDonateBar(context),
            ),
            const Spacer(),
            Expanded(
              flex: 4,
              child: FittedBox(
                child: Text(
                  projectItem.title,
                  style: const TextStyle(
                    color: Color(0xff686868),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 14,
              child: buildStatistics(context),
            ),
            const Spacer(
              flex: 3,
            ),
            const Expanded(
              flex: 2,
              child: FittedBox(
                child: Text(
                  "Title",
                  style: TextStyle(
                    color: Color(0xff686868),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            Expanded(
              flex: 5,
              child: FittedBox(
                child: buildDescription(context),
              ),
            ),
            const Spacer(
              flex: 3,
            ),
            const Expanded(
              flex: 2,
              child: FittedBox(
                child: Text(
                  "Gallery",
                  style: TextStyle(
                    color: Color(0xff686868),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const Spacer(
              flex: 2,
            ),
            Expanded(
              flex: 16,
              child: buildGallery(context),
            ),
            const Spacer(
              flex: 4,
            ),
            const Expanded(
              flex: 2,
              child: FittedBox(
                child: Text(
                  "Story",
                  style: TextStyle(
                    color: Color(0xff686868),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            Expanded(
              flex: 5,
              child: FittedBox(
                child: buildStory(context),
              ),
            ),
            const Spacer(
              flex: 5,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDonateBar(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
            flex: 8,
            child: Obx(
              () => SfRadialGauge(
                axes: [
                  RadialAxis(
                      showLabels: false,
                      showTicks: false,
                      startAngle: 112.5,
                      endAngle: 67.5,
                      minimum: 0,
                      maximum: 100,
                      radiusFactor: 0.87,
                      axisLineStyle: const AxisLineStyle(
                          thicknessUnit: GaugeSizeUnit.factor,
                          color: Color(0xffE6DDED),
                          thickness: 0.04),
                      annotations: [
                        GaugeAnnotation(
                          verticalAlignment: GaugeAlignment.center,
                          angle: 100,
                          widget: CircleAvatar(
                            radius: 44.0,
                            backgroundColor:
                                Get.theme.colorScheme.secondaryVariant,
                          ),
                        ),
                        GaugeAnnotation(
                          widget: Text("${projectItem.donation}%"),
                          positionFactor: 1.60,
                        ),
                      ],
                      pointers: [
                        RangePointer(
                            value: projectItem.donation.toDouble(),
                            cornerStyle: CornerStyle.bothCurve,
                            enableAnimation: true,
                            animationDuration: 1200,
                            animationType: AnimationType.ease,
                            sizeUnit: GaugeSizeUnit.factor,
                            color: Get.theme.colorScheme.primaryVariant,
                            width: 0.07),
                      ]),
                ],
              ),
            )),
        const Spacer(
          flex: 3,
        ),
        Flexible(
          flex: 12,
          child: ElevatedButton(
            onPressed: () {
              homeController.donate(projectItem);
            },
            child: const Text(
              "Donate",
            ),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  const Color(0xffF97A7A),
                ),
                foregroundColor: MaterialStateProperty.all<Color>(
                  const Color(0xffffffff),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                )),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  smallPadding(context),
                )),
          ),
        ),
      ],
    );
  }

  Widget buildStatistics(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Flexible(
          child: Column(
            children: const [
              Spacer(
                flex: 8,
              ),
              Expanded(
                flex: 6,
                child: FittedBox(
                  child: CircleAvatar(
                    radius: 10.0,
                    backgroundColor: Color(
                      0xffB986EF,
                    ),
                    foregroundColor: Colors.white,
                    child: Icon(
                      Icons.radio_button_checked_rounded,
                      size: 12.0,
                    ),
                  ),
                ),
              ),
              Spacer(
                flex: 2,
              ),
              Expanded(
                flex: 3,
                child: FittedBox(
                  child: Text(
                    "Target",
                    style: TextStyle(
                      color: Color(0xff8AE2A3),
                    ),
                  ),
                ),
              ),
              Spacer(
                flex: 1,
              ),
              Expanded(
                flex: 5,
                child: FittedBox(
                  child: Text(
                    "\$5000",
                    style: TextStyle(
                      color: Color(
                        0xffB986EF,
                      ),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Spacer(
                flex: 3,
              ),
            ],
          ),
        ),
        Flexible(
          child: Column(
            children: const [
              Spacer(
                flex: 8,
              ),
              Expanded(
                flex: 6,
                child: FittedBox(
                  child: CircleAvatar(
                    radius: 10.0,
                    backgroundColor: Color(
                      0xffB986EF,
                    ),
                    foregroundColor: Colors.white,
                    child: Icon(
                      Icons.attach_money,
                      size: 12.0,
                    ),
                  ),
                ),
              ),
              Spacer(
                flex: 2,
              ),
              Expanded(
                flex: 3,
                child: FittedBox(
                  child: Text(
                    "Pledget",
                    style: TextStyle(
                      color: Color(0xff8AE2A3),
                    ),
                  ),
                ),
              ),
              Spacer(
                flex: 1,
              ),
              Expanded(
                flex: 5,
                child: FittedBox(
                  child: Text(
                    "\$4,500",
                    style: TextStyle(
                      color: Color(
                        0xffB986EF,
                      ),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Spacer(
                flex: 3,
              ),
            ],
          ),
        ),
        Flexible(
          child: Column(
            children: const [
              Spacer(
                flex: 8,
              ),
              Expanded(
                flex: 6,
                child: FittedBox(
                  child: CircleAvatar(
                    radius: 10.0,
                    backgroundColor: Color(
                      0xffB986EF,
                    ),
                    foregroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      size: 12.0,
                    ),
                  ),
                ),
              ),
              Spacer(
                flex: 2,
              ),
              Expanded(
                flex: 3,
                child: FittedBox(
                  child: Text(
                    "Backers",
                    style: TextStyle(
                      color: Color(0xff8AE2A3),
                    ),
                  ),
                ),
              ),
              Spacer(
                flex: 1,
              ),
              Expanded(
                flex: 5,
                child: FittedBox(
                  child: Text(
                    "46",
                    style: TextStyle(
                      color: Color(
                        0xffB986EF,
                      ),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Spacer(
                flex: 3,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildDescription(BuildContext context) {
    return RichText(
      text: TextSpan(
          children: [
            TextSpan(
              text:
                  "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed\ndiam nonummy nibh euismod tincidunt ut laoreet dolore\nmagna aliquam erat volutpat. ",
              style: TextStyle(
                color: Get.theme.colorScheme.onBackground,
              ),
            ),
            TextSpan(
              text: "More...",
              recognizer: TapGestureRecognizer()..onTap = () => print("More"),
              style: TextStyle(
                color: Get.theme.colorScheme.secondaryVariant,
              ),
            ),
          ],
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          )),
    );
  }

  Widget buildGallery(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: const EdgeInsets.only(right: 15.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.asset(
              "assets/Asset 1.png",
              color: (index % 2 == 0) ? const Color(0xff8AE2A3) : null,
              colorBlendMode: BlendMode.color,
              fit: BoxFit.fill,
            ),
          ),
        );
      },
    );
  }

  Widget buildStory(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text:
                "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed\ndiam nonummy nibh euismod tincidunt ut laoreet dolore\nmagna aliquam erat volutpat. ",
            style: TextStyle(
              color: Get.theme.colorScheme.onBackground,
            ),
          ),
          TextSpan(
            text: "More...",
            recognizer: TapGestureRecognizer()..onTap = () => print("More"),
            style: TextStyle(
              color: Get.theme.colorScheme.secondaryVariant,
            ),
          ),
        ],
      ),
    );
  }
}

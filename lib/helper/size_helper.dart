import 'package:flutter/material.dart';
import 'package:get/get.dart';

Size get displaySize => Get.mediaQuery.size;

double get displayHeight => Get.mediaQuery.size.height;

double get displayWidth => Get.mediaQuery.size.width;

EdgeInsetsGeometry get largePadding => EdgeInsets.all(displayWidth * 0.12);

EdgeInsetsGeometry get mediumPadding => EdgeInsets.all(displayWidth * 0.08);

EdgeInsetsGeometry get smallPadding => EdgeInsets.all(displayWidth * 0.04);

EdgeInsetsGeometry get smallestPadding => EdgeInsets.all(displayWidth * 0.02);

EdgeInsetsGeometry get largeHorizontalPadding =>
    EdgeInsets.symmetric(horizontal: displayWidth * 0.12);

EdgeInsetsGeometry get mediumHorizontalPadding =>
    EdgeInsets.symmetric(horizontal: displayWidth * 0.08);

EdgeInsetsGeometry get smallHorizontalPadding =>
    EdgeInsets.symmetric(horizontal: displayWidth * 0.04);

EdgeInsetsGeometry get smallVerticalPadding =>
    EdgeInsets.symmetric(vertical: displayWidth * 0.04);

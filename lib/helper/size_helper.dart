import 'package:flutter/material.dart';

Size displaySize(BuildContext context) {
  return MediaQuery.of(context).size;
}

double displayHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double displayWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

EdgeInsetsGeometry largePadding(BuildContext context) {
  return EdgeInsets.all(displayWidth(context) * 0.12);
}

EdgeInsetsGeometry mediumPadding(BuildContext context) {
  return EdgeInsets.all(displayWidth(context) * 0.08);
}

EdgeInsetsGeometry smallPadding(BuildContext context) {
  return EdgeInsets.all(displayWidth(context) * 0.04);
}

EdgeInsetsGeometry smallestPadding(BuildContext context) {
  return EdgeInsets.all(displayWidth(context) * 0.02);
}

EdgeInsetsGeometry largeHorizontalPadding(BuildContext context) {
  return EdgeInsets.symmetric(horizontal: displayWidth(context) * 0.12);
}

EdgeInsetsGeometry mediumHorizontalPadding(BuildContext context) {
  return EdgeInsets.symmetric(horizontal: displayWidth(context) * 0.08);
}

EdgeInsetsGeometry smallHorizontalPadding(BuildContext context) {
  return EdgeInsets.symmetric(horizontal: displayWidth(context) * 0.04);
}

EdgeInsetsGeometry smallVerticalPadding(BuildContext context) {
  return EdgeInsets.symmetric(vertical: displayWidth(context) * 0.02);
}

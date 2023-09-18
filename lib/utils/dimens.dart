import 'package:flutter/material.dart';

class Dimens {
  static double getWidthPercentage(BuildContext context, double percentage) {
    return MediaQuery.sizeOf(context).width * percentage;
  }

   static double getHeightPercentage(BuildContext context, double percentage) {
    return MediaQuery.sizeOf(context).height * percentage;
  }
}

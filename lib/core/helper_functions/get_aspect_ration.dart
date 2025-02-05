import 'package:flutter/material.dart';

double getAspectRatio(BuildContext context) {
  double width = MediaQuery.sizeOf(context).width;

  if (width > 600) {
    return 0.65;
  } else if (width <= 370) {
    return 0.53;
  } else {
    return 0.55;
  }
}


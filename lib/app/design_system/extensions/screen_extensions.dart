import 'package:flutter/material.dart';

extension ScreenContext on BuildContext {
  double get screenHeight => MediaQuery.sizeOf(this).height;

  double get screenWidth => MediaQuery.sizeOf(this).width;

  double get screenHeightCenter => MediaQuery.sizeOf(this).height / 2;

  double get screenWidthCenter => MediaQuery.sizeOf(this).width / 2;
}

import 'package:flutter/material.dart';
import 'package:getapps/ui/core/theme/app_colors.dart';
import 'package:getapps/ui/core/theme/theme.dart';

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  ColorScheme get colorPalette => theme.colorScheme;

  AppColors get colors => theme.colors;

  TextTheme get textTheme => theme.textTheme;

  bool get themeIsDark => theme.colorScheme.brightness == Brightness.dark;
}

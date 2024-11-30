import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  ColorScheme get colorPalette => theme.colorScheme;

  TextTheme get textTheme => theme.textTheme;

  bool get themeIsDark => theme.colorScheme.brightness == Brightness.dark;
}

import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_style.dart';

export 'dark_theme.dart';
export 'light_theme.dart';
export 'local_theme.dart';

extension ThemeDataColorsExtension on ThemeData {
  AppColors get colors => extension<AppColors>()!;
}

extension ThemeDataTextsExtension on ThemeData {
  AppTextStyles get textStyles => extension<AppTextStyles>()!;
}


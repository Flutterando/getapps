import 'package:flutter/material.dart';

class AppTextStyles extends ThemeExtension<AppTextStyles> {
  final TextStyle headlineLarge;
  final TextStyle headlineSmall;
  final TextStyle bodyMedium;
  final TextStyle bodySmall;
  final TextStyle labelSmall;
  final TextStyle labelMedium;
  final TextStyle labelLarge;

  const AppTextStyles({
    this.headlineLarge = const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    this.headlineSmall = const TextStyle(
      fontSize: 16,
    ),
    this.bodyMedium = const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w500,
    ),
    this.bodySmall = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
    ),
    this.labelLarge = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    this.labelMedium = const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
    this.labelSmall = const TextStyle(
      fontSize: 8,
    ),
  });

  @override
  AppTextStyles copyWith({
    TextStyle? headlineLarge,
    TextStyle? headlineSmall,
    TextStyle? bodyMedium,
    TextStyle? bodySmall,
    TextStyle? labelLarge,
    TextStyle? labelSmall,
    TextStyle? labelMedium,
  }) {
    return AppTextStyles(
      headlineLarge: headlineLarge ?? this.headlineLarge,
      headlineSmall: headlineSmall ?? this.headlineSmall,
      bodyMedium: bodyMedium ?? this.bodyMedium,
      bodySmall: bodySmall ?? this.bodySmall,
      labelLarge: labelLarge ?? this.labelLarge,
      labelMedium: labelMedium ?? this.bodySmall,
      labelSmall: labelSmall ?? this.labelSmall,
    );
  }

  @override
  AppTextStyles lerp(ThemeExtension<AppTextStyles>? other, double t) {
    if (other is! AppTextStyles) {
      return this;
    }

    return AppTextStyles(
      headlineLarge: TextStyle.lerp(headlineLarge, other.headlineLarge, t)!,
      headlineSmall: TextStyle.lerp(headlineSmall, other.headlineSmall, t)!,
      bodyMedium: TextStyle.lerp(bodyMedium, other.bodyMedium, t)!,
      bodySmall: TextStyle.lerp(bodySmall, other.bodySmall, t)!,
      labelLarge: TextStyle.lerp(labelLarge, other.labelLarge, t)!,
      labelMedium: TextStyle.lerp(labelMedium, other.labelMedium, t)!,
      labelSmall: TextStyle.lerp(labelSmall, other.labelSmall, t)!,
    );
  }
}

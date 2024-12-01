import 'package:flutter/material.dart';

class AppColors extends ThemeExtension<AppColors> {
  //
  final Color blackBackground;

  final Color grayStrong;
  final Color grayMedium;
  final Color grayLight;
  final Color grayText;
  final Color grayHint;
  final Color white;
  final Color black;

  final Color red;

  const AppColors({
    this.blackBackground = const Color(0xFF18191B),
    this.grayStrong = const Color(0xFF28292B),
    this.grayMedium = const Color(0xFF36373B),
    this.grayLight = const Color(0xFF898B8C),
    this.grayText = const Color(0xFFB7B7B7),
    this.grayHint = const Color(0xFF898B8C),
    this.white = const Color(0xffffffff),
    this.black = const Color(0xff000000),
    this.red = const Color(0xffC22445),
  });

  @override
  AppColors copyWith({
    Color? blackBackground,
    Color? grayStrong,
    Color? grayMedium,
    Color? grayLight,
    Color? grayText,
    Color? grayHint,
    Color? red,
    Color? white,
    Color? black,
  }) {
    return AppColors(
      blackBackground: blackBackground ?? this.blackBackground,
      grayStrong: grayStrong ?? this.grayStrong,
      grayMedium: grayMedium ?? this.grayMedium,
      grayLight: grayLight ?? this.grayLight,
      grayText: grayText ?? this.grayText,
      grayHint: grayHint ?? this.grayHint,
      red: red ?? this.red,
      white: white ?? this.white,
      black: black ?? this.black,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    //
    if (other is! AppColors) return this;

    return AppColors(
      blackBackground: Color.lerp(blackBackground, other.blackBackground, t)!,
      grayStrong: Color.lerp(grayStrong, other.grayStrong, t)!,
      grayMedium: Color.lerp(grayMedium, other.grayMedium, t)!,
      grayLight: Color.lerp(grayLight, other.grayLight, t)!,
      grayText: Color.lerp(grayText, other.grayText, t)!,
      grayHint: Color.lerp(grayHint, other.grayHint, t)!,
      red: Color.lerp(red, other.red, t)!,
      white: Color.lerp(white, other.white, t)!,
      black: Color.lerp(black, other.black, t)!,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:getapps/app/design_system/design_system.dart';

class AppAvatar extends StatelessWidget {
  const AppAvatar._({
    required this.width,
    required this.height,
  });

  factory AppAvatar.medium() => const AppAvatar._(
        width: 64,
        height: 64,
      );

  factory AppAvatar.large() => const AppAvatar._(
        height: 96,
        width: 96,
      );

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 96,
      height: 96,
      padding: 12.0.paddingAll,
      decoration: BoxDecoration(
        color: context.themeIsDark ? const Color(0xffffffff) : const Color(0xff000000),
        borderRadius: BorderRadius.circular(24),
        border: context.themeIsDark
            ? Border.all(
                color: const Color(0xff333333),
                width: 1,
              )
            : null,
      ),
      child: const Placeholder(),
    );
  }
}

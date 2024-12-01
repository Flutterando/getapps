import 'package:flutter/material.dart';
import 'package:getapps/app/design_system/design_system.dart';

class AppAvatar extends StatelessWidget {
  const AppAvatar._({
    required this.width,
    required this.height,
    this.image,
  });

  factory AppAvatar.medium({Image? image}) => AppAvatar._(
        width: 64,
        height: 64,
        image: image,
      );

  factory AppAvatar.large({Image? image}) => AppAvatar._(
        height: 96,
        width: 96,
        image: image,
      );

  factory AppAvatar.extraLarge({Image? image}) => AppAvatar._(
        height: 104,
        width: 104,
        image: image,
      );

  final double width;
  final double height;
  final Image? image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 96,
      height: 96,
      padding: 12.0.paddingAll,
      decoration: BoxDecoration(
        color: context.themeIsDark
            ? const Color(0xffffffff)
            : const Color(0xff000000),
        borderRadius: BorderRadius.circular(24),
        border: context.themeIsDark
            ? Border.all(
                color: const Color(0xff333333),
                width: 1,
              )
            : null,
      ),
      child: image ?? const Placeholder(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:getapps/app/design_system/design_system.dart';

class AppTile extends StatelessWidget {
  const AppTile._({
    required this.title,
    required this.infoLabel,
    required this.sizeLabel,
    required this.onPressed,
    required this.isVertical,
    this.imageBytes,
  });

  factory AppTile.vertical({
    required String title,
    required String infoLabel,
    String? sizeLabel,
    required VoidCallback onPressed,
    List<int>? imageBytes,
  }) =>
      AppTile._(
        infoLabel: infoLabel,
        sizeLabel: sizeLabel ?? '',
        onPressed: onPressed,
        title: title,
        isVertical: true,
        imageBytes: imageBytes,
      );

  factory AppTile.horizontal({
    required String title,
    required String infoLabel,
    required String sizeLabel,
    required VoidCallback onPressed,
    List<int>? imageBytes,
  }) =>
      AppTile._(
        infoLabel: infoLabel,
        sizeLabel: sizeLabel,
        onPressed: onPressed,
        title: title,
        isVertical: false,
        imageBytes: imageBytes,
      );

  final String title;
  final String infoLabel;
  final String sizeLabel;
  final VoidCallback onPressed;
  final bool isVertical;
  final List<int>? imageBytes;

  @override
  Widget build(BuildContext context) {
    if (isVertical) {
      return GestureDetector(
        onTap: onPressed,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppAvatar.large(imageBytes: imageBytes),
            const Gap(12),
            Text(
              title,
              style: context.textTheme.labelLarge,
            ),
            Text(
              infoLabel,
              style: context.textTheme.labelMedium,
            ),
          ],
        ),
      );
    }

    return GestureDetector(
      onTap: onPressed,
      child: Row(
        children: [
          AppAvatar.medium(imageBytes: imageBytes),
          const Gap(12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: context.textTheme.bodyMedium,
              ),
              Text(
                infoLabel,
                style: context.textTheme.labelMedium,
              ),
              Text(
                sizeLabel,
                style: context.textTheme.labelMedium,
              ),
            ],
          )
        ],
      ),
    );
  }
}

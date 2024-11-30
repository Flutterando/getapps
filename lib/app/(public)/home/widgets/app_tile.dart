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
  });

  factory AppTile.vertical({
    required String title,
    required String infoLabel,
    required String sizeLabel,
    required VoidCallback onPressed,
  }) =>
      AppTile._(
        infoLabel: infoLabel,
        sizeLabel: sizeLabel,
        onPressed: onPressed,
        title: title,
        isVertical: true,
      );

  factory AppTile.horizontal({
    required String title,
    required String infoLabel,
    required String sizeLabel,
    required VoidCallback onPressed,
  }) =>
      AppTile._(
        infoLabel: infoLabel,
        sizeLabel: sizeLabel,
        onPressed: onPressed,
        title: title,
        isVertical: false,
      );

  final String title;
  final String infoLabel;
  final String sizeLabel;
  final VoidCallback onPressed;
  final bool isVertical;

  @override
  Widget build(BuildContext context) {
    if (isVertical) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppAvatar.large(),
          const Gap(12),
          Text(
            'Discord',
            style: context.textTheme.labelLarge,
          ),
          Text(
            '80 MB',
            style: context.textTheme.labelMedium,
          ),
        ],
      );
    }

    return Row(
      children: [
        AppAvatar.medium(),
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
    );
  }
}

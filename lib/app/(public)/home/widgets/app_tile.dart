import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:getapps/app/design_system/design_system.dart';

class AppTile extends StatelessWidget {
  const AppTile._({
    required this.title,
    required this.infoLabel,
    required this.sizeLabel,
    required this.isVertical,
    this.trailing = const SizedBox(),
    this.imageBytes,
  });

  factory AppTile.vertical({
    required String title,
    required String infoLabel,
    String? sizeLabel,
    required VoidCallback onPressed,
    List<int>? imageBytes,
    Widget trailing = const SizedBox(),
  }) =>
      AppTile._(
        infoLabel: infoLabel,
        sizeLabel: sizeLabel ?? '',
        title: title,
        isVertical: true,
        imageBytes: imageBytes,
        trailing: trailing,
      );

  factory AppTile.horizontal({
    required String title,
    required String infoLabel,
    required String sizeLabel,
    List<int>? imageBytes,
    Widget trailing = const SizedBox(),
  }) =>
      AppTile._(
        infoLabel: infoLabel,
        sizeLabel: sizeLabel,
        title: title,
        isVertical: false,
        imageBytes: imageBytes,
        trailing: trailing,
      );

  final String title;
  final String infoLabel;
  final String sizeLabel;
  final bool isVertical;
  final Widget trailing;
  final List<int>? imageBytes;

  @override
  Widget build(BuildContext context) {
    if (isVertical) {
      return Row(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
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
          const Spacer(),
          trailing,
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppAvatar.medium(imageBytes: imageBytes),
        const Gap(12),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: context.textTheme.bodyMedium?.copyWith(fontSize: 18),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  infoLabel,
                  style: context.textTheme.labelMedium,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  sizeLabel,
                  style: context.textTheme.labelMedium,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
        trailing,
      ],
    );
  }
}

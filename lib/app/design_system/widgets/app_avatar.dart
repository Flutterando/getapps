import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getapps/app/core/functions/functions.dart';
import 'package:getapps/app/design_system/design_system.dart';
import 'package:uicons/uicons.dart';

class AppAvatar extends StatefulWidget {
  const AppAvatar._({
    required this.width,
    required this.height,
    this.imageBytes,
  });

  factory AppAvatar.medium({List<int>? imageBytes}) => AppAvatar._(
        width: 64,
        height: 64,
        imageBytes: imageBytes,
      );

  factory AppAvatar.large({List<int>? imageBytes}) => AppAvatar._(
        height: 96,
        width: 96,
        imageBytes: imageBytes,
      );

  factory AppAvatar.extraLarge({List<int>? imageBytes}) => AppAvatar._(
        height: 104,
        width: 104,
        imageBytes: imageBytes,
      );

  final double width;
  final double height;
  final List<int>? imageBytes;

  @override
  State<AppAvatar> createState() => _AppAvatarState();
}

class _AppAvatarState extends State<AppAvatar> {
  late Color _currentColor = const Color(0xff000000);

  @override
  void initState() {
    super.initState();
    getColorApp();
  }

  getColorApp() async {
    if (widget.imageBytes != null && widget.imageBytes!.isNotEmpty) {
      final color = (await getDominantColor(widget.imageBytes!)).color;
      setState(() {
        _currentColor = color;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 96,
      height: 96,
      padding: 12.0.paddingAll,
      decoration: BoxDecoration(
        color: widget.imageBytes != null && widget.imageBytes!.isNotEmpty //
            ? _currentColor
            : context.themeIsDark //
                ? context.colors.white
                : context.colors.black,
        borderRadius: BorderRadius.circular(24),
        border: context.themeIsDark
            ? Border.all(
                color: const Color(0xff333333),
                width: 1,
              )
            : null,
      ),
      child: widget.imageBytes != null && widget.imageBytes!.isNotEmpty
          ? Image.memory(
              Uint8List.fromList(
                widget.imageBytes!,
              ),
              fit: BoxFit.cover,
            )
          : Icon(UIcons.regularRounded.question, size: 32),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  Uint8List? _imageBytes;
  MemoryImage? _memoryImage;

  bool get hasImage => widget.imageBytes != null && widget.imageBytes!.isNotEmpty;

  @override
  void initState() {
    super.initState();
    if (hasImage) {
      _imageBytes = Uint8List.fromList(widget.imageBytes!);
      _memoryImage = MemoryImage(_imageBytes!);
    }
  }

  @override
  void didUpdateWidget(covariant AppAvatar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!hasImage) {
      _imageBytes = null;
      _memoryImage = null;
    } else if (widget.imageBytes?.length != oldWidget.imageBytes?.length) {
      _imageBytes = Uint8List.fromList(widget.imageBytes!);
      _memoryImage = MemoryImage(_imageBytes!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (child, animation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      child: ClipOval(
        key: ObjectKey(_memoryImage),
        child: SizedBox(
          width: widget.width,
          height: widget.height,
          child: hasImage
              ? Image(
                  image: _memoryImage!,
                  fit: BoxFit.cover,
                  gaplessPlayback: true,
                )
              : Container(
                  color: Colors.black,
                  child: Icon(UIcons.regularRounded.question, size: 32),
                ),
        ),
      ),
    );
  }
}

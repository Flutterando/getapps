import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getapps/app/core/functions/functions.dart';
import 'package:getapps/app/design_system/design_system.dart';
import 'package:uicons/uicons.dart';

class HighlightCard extends StatefulWidget {
  const HighlightCard({
    super.key,
    required this.title,
    required this.infoLabel,
    required this.sizeLabel,
    this.trailing = const SizedBox(),
    this.imageBytes,
    this.color = const Color(0xff000000),
  });

  final String title;
  final String infoLabel;
  final String sizeLabel;
  final Color color;
  final Widget trailing;
  final List<int>? imageBytes;

  @override
  State<HighlightCard> createState() => _HighlightCardState();
}

class _HighlightCardState extends State<HighlightCard> {
  late Color _currentColor;
  late bool _colorImageIsWhite = false;

  @override
  void initState() {
    super.initState();
    _currentColor = widget.color;

    getColorApp();
  }

  void getColorApp() async {
    if (widget.imageBytes != null && widget.imageBytes!.isNotEmpty) {
      final domainColor = await getDominantColor(widget.imageBytes!);
      setState(() {
        _currentColor = domainColor.color;
        _colorImageIsWhite = domainColor.isWhiteColor;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 12.0.paddingRight,
      child: LayoutBuilder(builder: (context, constraints) {
        return _colorImageIsWhite
            ? LocalTheme.light(
                builder: (context) {
                  return Card(
                    color: _currentColor,
                    child: Row(
                      children: [
                        Container(
                          padding: 8.0.paddingAll,
                          width: constraints.maxWidth * 0.3,
                          child: widget.imageBytes != null && widget.imageBytes!.isNotEmpty
                              ? Image.memory(
                                  Uint8List.fromList(widget.imageBytes!),
                                  fit: BoxFit.cover,
                                )
                              : Icon(UIcons.regularRounded.question, size: 32),
                        ),
                        Container(
                          padding: 12.0.paddingLeft,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.title,
                                style: context.textTheme.headlineLarge,
                              ),
                              Text(
                                widget.infoLabel,
                                style: context.textTheme.labelMedium,
                              ),
                              Text(
                                widget.sizeLabel,
                                style: context.textTheme.labelMedium,
                              ),
                            ],
                          ),
                        ),
                        widget.trailing,
                      ],
                    ),
                  );
                },
              )
            : LocalTheme.dark(
                builder: (context) {
                  return Card(
                    color: _currentColor,
                    child: Stack(
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: 8.0.paddingAll,
                              width: constraints.maxWidth * 0.3,
                              child: AppAvatar.medium(imageBytes: widget.imageBytes),
                            ),
                            Container(
                              padding: 8.0.paddingLeft,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    widget.title,
                                    style: context.textTheme.headlineLarge,
                                  ),
                                  Text(
                                    widget.infoLabel,
                                    style: context.textTheme.labelMedium,
                                  ),
                                  Text(
                                    widget.sizeLabel,
                                    style: context.textTheme.labelMedium,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          bottom: 10,
                          right: 10,
                          child: widget.trailing,
                        ),
                      ],
                    ),
                  );
                },
              );
      }),
    );
  }
}

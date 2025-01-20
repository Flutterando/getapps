import 'package:flutter/material.dart';
import 'package:getapps/ui/core/core.dart';
import 'package:getapps/utils/extensions/extensions.dart';

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

  @override
  void initState() {
    super.initState();
    _currentColor = widget.color;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 12.0.paddingRight,
      child: LayoutBuilder(builder: (context, constraints) {
        return LocalTheme.dark(
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

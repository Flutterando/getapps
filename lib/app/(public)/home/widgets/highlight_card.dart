import 'package:flutter/material.dart';
import 'package:getapps/app/design_system/design_system.dart';

class HighlightCard extends StatelessWidget {
  const HighlightCard({
    super.key,
    required this.title,
    required this.infoLabel,
    required this.sizeLabel,
    required this.onPressed,
    this.color = const Color(0xff000000),
  });

  final String title;
  final String infoLabel;
  final String sizeLabel;
  final VoidCallback onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 12.0.paddingRight,
      child: LayoutBuilder(builder: (context, constraints) {
        return GestureDetector(
          onTap: onPressed,
          child: LocalTheme.dark(
            builder: (context) {
              return Card(
                color: color,
                child: Row(
                  children: [
                    Container(
                      padding: 8.0.paddingAll,
                      width: constraints.maxWidth * 0.3,
                      child: const Placeholder(),
                    ),
                    Container(
                      padding: 12.0.paddingLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: context.textTheme.headlineLarge,
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
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        );
      }),
    );
  }
}

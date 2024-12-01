import 'package:flutter/material.dart';
import 'package:getapps/app/design_system/design_system.dart';

class TitleSectionHome extends StatelessWidget {
  const TitleSectionHome({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 16.0.paddingHorizontal + 12.0.paddingBottom,
      child: Text(
        title,
        style: context.textTheme.headlineSmall,
      ),
    );
  }
}
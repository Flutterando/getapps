import 'package:flutter/material.dart';
import 'package:getapps/app/design_system/design_system.dart';

class SliverDefaultAppbar extends StatelessWidget {
  const SliverDefaultAppbar({
    super.key,
    required this.onBack,
    this.title,
  });

  final VoidCallback onBack;
  final Widget? title;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: 75,
      surfaceTintColor: context.colorPalette.surface,
      leading: GestureDetector(
        onTap: onBack,
        child: Icon(
          Icons.arrow_back_ios,
          size: 13,
          color: context.themeIsDark //
              ? context.colors.white
              : context.colors.black,
        ),
      ),
      floating: true,
      centerTitle: title != null,
      title: title,
    );
  }
}

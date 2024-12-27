import 'package:flutter/material.dart';
import 'package:getapps/utils/extensions/extensions.dart';

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
    final transition = ModalRoute.of(context)!.animation!;
    final translateTween = Tween<double>(begin: 100.0, end: 0.0);
    final translateTextAnimation = transition.drive(translateTween);

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
      title: AnimatedBuilder(
          animation: transition,
          builder: (context, _) {
            return Opacity(
              opacity: transition.value,
              child: Transform.translate(
                offset: Offset(translateTextAnimation.value, 0.0),
                child: title!,
              ),
            );
          }),
    );
  }
}

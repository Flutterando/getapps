import 'package:flutter/widgets.dart';

Route iOSTransition(
  BuildContext context,
  RouteSettings settings,
  Widget page,
) {
  return PageRouteBuilder(
    settings: settings,
    pageBuilder: (context, animation, secondaryAnimation) {
      return _SecondAnimationWrapper(
        secondaryAnimation: secondaryAnimation,
        child: page,
      );
    },
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const Offset begin = Offset(1.0, 0.0);
      const Offset end = Offset.zero;
      const Curve curve = Curves.easeInOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}

class _SecondAnimationWrapper extends StatelessWidget {
  const _SecondAnimationWrapper({
    required this.child,
    required this.secondaryAnimation,
  });

  final Widget child;
  final Animation<double> secondaryAnimation;

  @override
  Widget build(BuildContext context) {
    const curve = Curves.easeInOut;

    var previousPageTween = Tween(
      begin: Offset.zero,
      end: const Offset(-0.3, 0.0),
    ).chain(CurveTween(curve: curve));
    var previousPageAnimation = secondaryAnimation.drive(previousPageTween);
    return AnimatedBuilder(
      animation: previousPageAnimation,
      builder: (context, _) {
        return SlideTransition(
          position: previousPageAnimation,
          child: child,
        );
      },
    );
  }
}

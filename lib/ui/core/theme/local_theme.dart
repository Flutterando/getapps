import 'package:flutter/material.dart';
import 'package:getapps/ui/core/core.dart';
import 'package:getapps/utils/extensions/extensions.dart';

class LocalTheme extends StatelessWidget {
  const LocalTheme._({
    required this.builder,
    required this.newTheme,
  });

  factory LocalTheme.dark({
    required WidgetBuilder builder,
  }) {
    return LocalTheme._(
      builder: builder,
      newTheme: darkTheme,
    );
  }

  factory LocalTheme.light({
    required WidgetBuilder builder,
  }) {
    return LocalTheme._(
      builder: builder,
      newTheme: lightTheme,
    );
  }

  factory LocalTheme.invert({
    required BuildContext context,
    required WidgetBuilder builder,
  }) {
    return LocalTheme._(
      builder: builder,
      newTheme: context.theme.brightness == darkTheme.brightness //
          ? lightTheme
          : darkTheme,
    );
  }

  final WidgetBuilder builder;
  final ThemeData newTheme;

  @override
  Widget build(BuildContext context) {
    return Theme(data: newTheme, child: Builder(builder: builder));
  }
}

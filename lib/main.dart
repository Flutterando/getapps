import 'package:flutter/material.dart';
import 'package:routefly/routefly.dart';

import 'config/dependencies.dart';
import 'main.route.dart';
import 'ui/core/core.dart';
import 'utils/transitions/transitions.dart';

part 'main.g.dart';

void main() {
  setupInjection();
  runApp(const AppWidget());
}

@Main('lib/ui')
class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      routerConfig: Routefly.routerConfig(
        routes: routes,
        initialPath: routePaths.splash,
        routeBuilder: iOSTransition,
      ),
    );
  }
}

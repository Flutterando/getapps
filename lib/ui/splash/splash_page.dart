import 'package:flutter/material.dart';
import 'package:getapps/main.dart';
import 'package:getapps/ui/home/view_models/home_viewmodel.dart';
import 'package:getapps/ui/splash/view_models/splash_viewmodel.dart';
import 'package:routefly/routefly.dart';

import '../../config/dependencies.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final homeViewmodel = injector.get<HomeViewmodel>();
  final splashViewModel = injector.get<SplashViewmodel>();

  @override
  void initState() {
    super.initState();

    Future.any([
      homeViewmodel.fetchAppsCommand.execute(),
      splashViewModel.addThisAppInformationCommand.execute(),
      Future.delayed(const Duration(milliseconds: 2000)),
    ]).then((_) {
      Routefly.navigate(routePaths.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

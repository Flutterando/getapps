import 'package:flutter/material.dart';
import 'package:getapps/app/(public)/home/view_models/home_viewmodel.dart';
import 'package:getapps/app/app.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final homeViewmodel = injector.get<HomeViewmodel>();

  @override
  void initState() {
    super.initState();

    Future.any([
      homeViewmodel.fetchAppsCommand.execute(),
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

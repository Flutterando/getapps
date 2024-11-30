import 'package:flutter/material.dart';
import 'package:getapps/app/app.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 800)).then((_) {
      Routefly.navigate(routePaths.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

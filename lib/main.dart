import 'package:flutter/material.dart';

import 'app/app_widget.dart';
import 'app/injector.dart';

void main() {
  setupInjection();
  runApp(const AppWidget());
}

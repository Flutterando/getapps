import 'dart:async';

import 'package:result_dart/functions.dart';
import 'package:result_dart/result_dart.dart';

extension CustomResultExtension<T extends Object> on ResultDart<T, T> {
  T merge() {
    return fold(id, id);
  }
}

extension CustomAsyncResultExtension<T extends Object> on AsyncResultDart<T, T> {
  Future<T> merge() {
    return fold<T>(id, id);
  }
}

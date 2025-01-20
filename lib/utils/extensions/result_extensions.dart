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

Result<List<T>> batchResult<T extends Object>(
  List<T> values,
  Result<T> Function(T value) batch,
) {
  final newValues = <T>[];

  for (var value in values) {
    final result = batch(value);
    if (result.isError()) {
      return result.pure([]);
    }

    newValues.add(result.getOrThrow());
  }

  return Success(newValues);
}

AsyncResult<List<T>> asyncBatchResult<T extends Object>(
  List<T> values,
  AsyncResult<T> Function(T value) asyncBatch,
) async {
  final newValues = <T>[];

  for (var value in values) {
    final result = await asyncBatch(value);

    if (result.isError()) {
      return result.pure([]);
    }

    newValues.add(result.getOrThrow());
  }

  return Success(newValues);
}

import 'package:asp/asp.dart';
import 'package:getapps/app/core/states/state.dart';
import 'package:result_dart/result_dart.dart';

import '../exceptions/exception.dart';

extension AsyncResultCustomExtension<T extends Object> on AsyncResult<T> {
  AsyncResult<T> updateState(Atom<T> state, SetState set) {
    return fold((s) {
      set(baseLoadingState, false);
      set(state, s);
      return Success(s);
    }, (e) {
      if (e is AppException) {
        set(baseExceptionState, e);
      }
      set(baseLoadingState, false);
      return Failure(e);
    });
  }
}

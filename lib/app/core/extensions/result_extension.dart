import 'package:asp/asp.dart';
import 'package:getapps/app/core/states/state.dart';
import 'package:result_dart/result_dart.dart';

extension AsyncResultExtension<T extends Object, E extends Object> on AsyncResult<T, E> {
  AsyncResult<T, E> updateState(Atom<T> state, SetState set) {
    return fold((s) {
      set(baseLoadingState, false);
      set(state, s);
      return Result.success(s);
    }, (e) {
      set(baseExceptionState, e);
      set(baseLoadingState, false);
      return Result.failure(e);
    });
  }
}

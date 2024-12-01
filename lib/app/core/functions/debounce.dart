import 'dart:async';
import 'dart:ui';

class Debounce {
  Debounce({required this.delay});

  final Duration delay;

  Timer? _timer;

  void call(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(delay, action);
  }

  void cancel() => _timer?.cancel();
}

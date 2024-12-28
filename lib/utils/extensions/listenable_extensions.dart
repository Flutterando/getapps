// Listenable to Stream
import 'dart:async';

import 'package:flutter/material.dart';

extension ListenableExtensions<T extends Listenable> on T {
  Stream<T> toStream() {
    late final StreamController<T> controller;

    void listener() {
      controller.add(this);
    }

    controller = StreamController<T>(
      onListen: () {
        controller.add(this);
        addListener(listener);
      },
      onCancel: () {
        removeListener(listener);
        controller.close();
      },
    );

    return controller.stream;
  }
}

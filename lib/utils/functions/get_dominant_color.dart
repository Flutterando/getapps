import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DomainColor {
  DomainColor({
    required this.color,
    required this.isWhiteColor,
  });

  final Color color;
  final bool isWhiteColor;
}

Future<DomainColor> getDominantColor(List<int> elements) async {
  if (elements.isEmpty) {
    return DomainColor(
      color: Colors.transparent,
      isWhiteColor: false,
    );
  }

  final colors = await ColorScheme.fromImageProvider(
    provider: MemoryImage(Uint8List.fromList(elements)),
  );

  return DomainColor(
    color: colors.primary,
    isWhiteColor: false,
  );
}

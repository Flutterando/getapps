import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;

class DomainColor {
  DomainColor({
    required this.color,
    required this.isWhiteColor,
  });

  final Color color;
  final bool isWhiteColor;
}

Future<DomainColor> getDominantColor(List<int> elements) async {
  img.Image? image = img.decodeImage(Uint8List.fromList(elements));
  if (image == null) {
    return DomainColor(
      color: Colors.transparent,
      isWhiteColor: false,
    );
  }

  final Map<String, int> colorFrequency = {};

  for (int x = 0; x < image.width; x++) {
    for (int y = 0; y < image.height; y++) {
      img.Pixel pixel = image.getPixel(x, y);

      String colorKey = '${pixel.r}-${pixel.g}-${pixel.b}';

      colorFrequency[colorKey] = (colorFrequency[colorKey] ?? 0) + 1;
    }
  }

  String dominantColorKey =
      colorFrequency.entries.reduce((a, b) => a.value > b.value ? a : b).key;

  List<String> rgb = dominantColorKey.split('-');
  int r = int.parse(rgb[0]);
  int g = int.parse(rgb[1]);
  int b = int.parse(rgb[2]);

  bool isNearWhite = r > 200 && g > 200 && b > 200;

  return DomainColor(
    color: Color.fromRGBO(r, g, b, 1),
    isWhiteColor: isNearWhite,
  );
}

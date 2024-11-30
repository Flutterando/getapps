import 'package:flutter/foundation.dart';

class AppReleaseEntity {
  final String tagName;
  final List<String> assets;

  AppReleaseEntity({
    required this.tagName,
    required this.assets,
  });

  // empty
  static AppReleaseEntity empty() {
    return AppReleaseEntity(
      tagName: '',
      assets: [],
    );
  }

  @override
  bool operator ==(covariant AppReleaseEntity other) {
    if (identical(this, other)) return true;

    return other.tagName == tagName && listEquals(other.assets, assets);
  }

  @override
  int get hashCode => tagName.hashCode ^ assets.hashCode;
}

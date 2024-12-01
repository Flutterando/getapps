// ignore_for_file: public_member_api_docs, sort_constructors_first
class PackageInfo {
  final String name;
  final String packageId;
  final String version;
  final List<int> icon;

  PackageInfo({
    required this.name,
    required this.version,
    required this.packageId,
    required this.icon,
  });

  factory PackageInfo.fromMap(Map map) {
    return PackageInfo(
      name: map['name'],
      version: map['version'],
      packageId: map['packageId'],
      icon: List<int>.from(map['icon']),
    );
  }

  @override
  String toString() => 'PackageInfo(name: $name, packageId: $packageId, version: $version, icon: ${icon.length})';
}

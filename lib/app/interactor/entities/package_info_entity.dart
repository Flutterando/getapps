class PackageInfoEntity {
  final String id;
  final String name;
  final List<int> imageBytes;
  final String version;

  PackageInfoEntity({
    required this.id,
    required this.name,
    required this.imageBytes,
    required this.version,
  });

  // empty factory
  factory PackageInfoEntity.empty() {
    return PackageInfoEntity(
      id: '',
      name: '',
      imageBytes: [],
      version: '',
    );
  }
}

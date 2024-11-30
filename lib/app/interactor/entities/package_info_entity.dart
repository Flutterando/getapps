class PackageInfoEntity {
  final String id;
  final String? name;
  final List<int> imageBytes;
  final String version;

  PackageInfoEntity({
    required this.id,
    this.name,
    required this.imageBytes,
    required this.version,
  });

  factory PackageInfoEntity.empty() {
    return EmptyPackageInfoEntity();
  }
}

class EmptyPackageInfoEntity extends PackageInfoEntity {
  EmptyPackageInfoEntity()
      : super(
          id: '',
          imageBytes: [],
          version: '',
        );
}

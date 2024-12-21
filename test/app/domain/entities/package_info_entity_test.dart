import 'package:flutter_test/flutter_test.dart';
import 'package:getapps/app/app.dart';

void main() {
  test('package info entity ...', () {
    var packageInfoEntity = const PackageInfoEntity.empty();
    print(packageInfoEntity);
    print(packageInfoEntity.runtimeType);
    print(packageInfoEntity is PackageInfoEntity);
    print(packageInfoEntity is EmptyPackageInfoEntity);

    print(packageInfoEntity.toJson());
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:getapps/domain/entities/app_entity.dart';
import 'package:getapps/domain/entities/repository_entity.dart';

void main() {
  test('app entity ...', () async {
    const repository = RepositoryEntity(
      provider: GitRepositoryProvider.github,
      organizationName: 'ds',
      projectName: 'ds',
    );
    final appEntity = AppEntity.notInstallApp(repository);

    final s = appEntity.copyWith.currentRelease(tagName: '1.0.0');
    print(s);
  });

  test('unions', () {});
}

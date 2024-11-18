import 'package:flutter_test/flutter_test.dart';
import 'package:getapps/app/features/actions/app_actions.dart';

void main() {
  group('registerAppRepositoryAction', () {
    test('Complete dto url', () {
      registerAppRepositoryAction('https://github.com/Flutterando/yuno/releases');
    });
  });
}

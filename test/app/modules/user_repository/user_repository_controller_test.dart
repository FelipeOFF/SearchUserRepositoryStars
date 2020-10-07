import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:github_repository_stars/app/modules/user_repository/user_repository_controller.dart';
import 'package:github_repository_stars/app/modules/user_repository/user_repository_module.dart';

void main() {
  initModule(UserRepositoryModule());
  // UserRepositoryController userrepository;
  //
  setUp(() {
    //     userrepository = UserRepositoryModule.to.get<UserRepositoryController>();
  });

  group('UserRepositoryController Test', () {
    //   test("First Test", () {
    //     expect(userrepository, isInstanceOf<UserRepositoryController>());
    //   });

    //   test("Set Value", () {
    //     expect(userrepository.value, equals(0));
    //     userrepository.increment();
    //     expect(userrepository.value, equals(1));
    //   });
  });
}

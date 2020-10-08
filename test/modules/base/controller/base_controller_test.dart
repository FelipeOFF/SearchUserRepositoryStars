import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_repository_stars/app/app_module.dart';
import 'package:github_repository_stars/app/modules/base/controller/base_controller.dart';
import 'package:github_repository_stars/app/modules/domain/exceptions/server_exception.dart';
import 'package:github_repository_stars/app/modules/domain/i_use_case.dart';

class UseCaseMock extends IUseCase<void, String> {
  final String mockValue;
  ServerException serverException;

  UseCaseMock(this.mockValue, {this.serverException});

  @override
  Future<String> execute(void value) async {
    if (serverException != null) {
      throw serverException;
    }
    return mockValue;
  }
}

main() {
  initModule(AppModule());

  BaseController baseController = Modular.get();

  String mockValueReturn = "Teste";

  test("On execute a UseCase and return loading and value return result", () async {
    IUseCase useCase = UseCaseMock(mockValueReturn);
    await baseController.exec(null, useCase, onSuccess: (value) => expect(value, mockValueReturn));

    expect(baseController.errorMessage, null);
  });

  test("On execute a UseCase and return loading and value and return error", () async {
    String errorMock = "Error teste";
    IUseCase useCase = UseCaseMock(mockValueReturn, serverException: ServerException(errorMock));
    await baseController.exec(null, useCase, onSuccess: (value) => expect(value, null));

    expect(baseController.errorMessage, errorMock);
  });
}

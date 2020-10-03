import 'package:github_repository_stars/app/modules/domain/result_wrapper.dart';

abstract class IUseCase<PARAM, RESULT> {
  Future<RESULT> execute(PARAM value);

  Stream<IResultWrapper<RESULT>> result;

  Stream<IResultWrapper<RESULT>> call(PARAM value) async* {
    yield Loading();
    try {
      yield Success(await execute(value), usecaseCalled: this);
    } catch (e) {
      yield Failure(e, usecaseCalled: this);
    } finally {
      yield DismissLoading();
    }
  }
}

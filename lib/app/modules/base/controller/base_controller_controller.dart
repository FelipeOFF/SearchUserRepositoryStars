import 'package:github_repository_stars/app/modules/domain/exceptions/server_exception.dart';
import 'package:github_repository_stars/app/modules/domain/i_use_case.dart';
import 'package:github_repository_stars/app/modules/domain/result_wrapper.dart';
import 'package:mobx/mobx.dart';

part 'base_controller_controller.g.dart';

class BaseControllerController = _BaseControllerControllerBase with _$BaseControllerController;

abstract class _BaseControllerControllerBase with Store {
  @observable
  bool showLoading = false;

  @observable
  String errorMessage;

  @action
  void setShowLoadin(bool value) {
    showLoading = value;
  }

  @action
  void setErroMessage(String value) {
    errorMessage = value;
  }

  @action
  exec<PARAM, RESULT>(
    PARAM param,
    IUseCase<PARAM, RESULT> usecase, {
    void Function(RESULT) onSuccess,
    String Function(String) onError,
  }) async {
    await for (var event in usecase(param)) {
      if (event is Success<RESULT>) {
        if (onSuccess != null) {
          onSuccess(event.value);
        }
      } else if (event is Loading) {
        setShowLoadin(true);
      } else if (event is DismissLoading) {
        setShowLoadin(false);
      } else if (event is Failure<RESULT> && event.error is ServerException) {
        _resolveError(onError, (event.error as ServerException).message);
      } else {
        _resolveError(onError);
      }
    }
  }

  void _resolveError(String Function(String) onError, [String errorFromBusinnes]) {
    String error = errorFromBusinnes;
    if (onError != null) {
      error = onError(error);
    }
    if (error != null) {
      setErroMessage(error);
    }
  }
}

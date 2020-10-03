import 'package:github_repository_stars/app/modules/domain/i_use_case.dart';

abstract class IResultWrapper<T> {
  final IUseCase usecaseCalled;

  const IResultWrapper({this.usecaseCalled});
}

class Success<T> extends IResultWrapper<T> {
  T value;

  @override
  final IUseCase usecaseCalled;

  Success(this.value, {this.usecaseCalled}) : super(usecaseCalled: usecaseCalled);
}

class Failure<T extends Error> extends IResultWrapper<T> {
  Error error;

  @override
  final IUseCase usecaseCalled;

  Failure(this.error, {this.usecaseCalled}) : super(usecaseCalled: usecaseCalled);
}

class Loading extends IResultWrapper<Null> {}

class DismissLoading extends IResultWrapper<Null> {}

// ERRORS

class ServerError extends Error {
  String message;
}

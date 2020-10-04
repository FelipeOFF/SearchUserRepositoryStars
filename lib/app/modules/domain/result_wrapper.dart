abstract class IResultWrapper<T> {}

class Success<T> extends IResultWrapper<T> {
  final T value;

  Success(this.value);
}

class Failure<T> extends IResultWrapper<T> {
  final Error error;

  Failure(this.error);
}

class Loading extends IResultWrapper<Null> {}

class DismissLoading extends IResultWrapper<Null> {}

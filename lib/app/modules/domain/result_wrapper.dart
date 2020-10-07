import 'package:equatable/equatable.dart';

abstract class IResultWrapper<T> extends Equatable {}

class Success<T> extends IResultWrapper<T> {
  final T value;

  Success(this.value);

  @override
  List<Object> get props => [value];
}

class Failure<T> extends IResultWrapper<T> {
  final Exception error;

  Failure(this.error);

  @override
  List<Object> get props => [error];
}

class Loading extends IResultWrapper<Null> {
  @override
  List<Object> get props => [];
}

class DismissLoading extends IResultWrapper<Null> {
  @override
  List<Object> get props => [];
}

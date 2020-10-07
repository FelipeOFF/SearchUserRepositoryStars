import 'package:equatable/equatable.dart';

class ServerException extends Equatable with Exception {
  final String message;

  ServerException(this.message);

  @override
  List<Object> get props => [message];
}

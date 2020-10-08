import 'package:equatable/equatable.dart';

class ServerException extends Error with EquatableMixin {
  final String message;

  ServerException(this.message);

  @override
  List<Object> get props => [message];
}

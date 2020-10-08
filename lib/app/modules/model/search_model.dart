import 'package:equatable/equatable.dart';

class SearchModel extends Equatable {
  String search;
  String afterCursor;
  int count;

  SearchModel(this.search, {this.afterCursor, this.count = 20});

  @override
  List<Object> get props => [search, afterCursor, count];
}

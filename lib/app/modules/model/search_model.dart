import 'package:equatable/equatable.dart';

class SearchModel extends Equatable {
  final String search;
  final String afterCursor;
  final int count;

  const SearchModel(this.search, {this.afterCursor, this.count = 20});

  @override
  List<Object> get props => [search, afterCursor, count];
}

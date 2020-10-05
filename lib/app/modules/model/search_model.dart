class SearchModel {
  String search;
  String afterCursor;
  int count;

  SearchModel(this.search, {this.afterCursor, this.count = 20});
}

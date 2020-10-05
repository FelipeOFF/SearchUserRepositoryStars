// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$showSearchBarAtom = Atom(name: '_HomeControllerBase.showSearchBar');

  @override
  bool get showSearchBar {
    _$showSearchBarAtom.reportRead();
    return super.showSearchBar;
  }

  @override
  set showSearchBar(bool value) {
    _$showSearchBarAtom.reportWrite(value, super.showSearchBar, () {
      super.showSearchBar = value;
    });
  }

  final _$queryAtom = Atom(name: '_HomeControllerBase.query');

  @override
  QueryGithubUserRepositoryStars get query {
    _$queryAtom.reportRead();
    return super.query;
  }

  @override
  set query(QueryGithubUserRepositoryStars value) {
    _$queryAtom.reportWrite(value, super.query, () {
      super.query = value;
    });
  }

  final _$searchValueAtom = Atom(name: '_HomeControllerBase.searchValue');

  @override
  String get searchValue {
    _$searchValueAtom.reportRead();
    return super.searchValue;
  }

  @override
  set searchValue(String value) {
    _$searchValueAtom.reportWrite(value, super.searchValue, () {
      super.searchValue = value;
    });
  }

  final _$goToNextPageAsyncAction =
      AsyncAction('_HomeControllerBase.goToNextPage');

  @override
  Future goToNextPage() {
    return _$goToNextPageAsyncAction.run(() => super.goToNextPage());
  }

  final _$searchAsyncAction = AsyncAction('_HomeControllerBase.search');

  @override
  Future search(String name) {
    return _$searchAsyncAction.run(() => super.search(name));
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  dynamic togleShowSearchBar() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.togleShowSearchBar');
    try {
      return super.togleShowSearchBar();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
showSearchBar: ${showSearchBar},
query: ${query},
searchValue: ${searchValue}
    ''';
  }
}

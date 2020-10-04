// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
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

  final _$searchAsyncAction = AsyncAction('_HomeControllerBase.search');

  @override
  Future search(String name) {
    return _$searchAsyncAction.run(() => super.search(name));
  }

  @override
  String toString() {
    return '''
query: ${query}
    ''';
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_repository_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserRepositoryController on _UserRepositoryControllerBase, Store {
  final _$nodeUserAtom = Atom(name: '_UserRepositoryControllerBase.nodeUser');

  @override
  NodeUser get nodeUser {
    _$nodeUserAtom.reportRead();
    return super.nodeUser;
  }

  @override
  set nodeUser(NodeUser value) {
    _$nodeUserAtom.reportWrite(value, super.nodeUser, () {
      super.nodeUser = value;
    });
  }

  final _$_UserRepositoryControllerBaseActionController =
      ActionController(name: '_UserRepositoryControllerBase');

  @override
  void addUser(NodeUser nodeUser) {
    final _$actionInfo = _$_UserRepositoryControllerBaseActionController
        .startAction(name: '_UserRepositoryControllerBase.addUser');
    try {
      return super.addUser(nodeUser);
    } finally {
      _$_UserRepositoryControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nodeUser: ${nodeUser}
    ''';
  }
}

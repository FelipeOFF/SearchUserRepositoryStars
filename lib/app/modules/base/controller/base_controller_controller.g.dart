// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_controller_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BaseControllerController on _BaseControllerControllerBase, Store {
  final _$showLoadingAtom =
      Atom(name: '_BaseControllerControllerBase.showLoading');

  @override
  bool get showLoading {
    _$showLoadingAtom.reportRead();
    return super.showLoading;
  }

  @override
  set showLoading(bool value) {
    _$showLoadingAtom.reportWrite(value, super.showLoading, () {
      super.showLoading = value;
    });
  }

  final _$errorMessageAtom =
      Atom(name: '_BaseControllerControllerBase.errorMessage');

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  final _$_executorAsyncAction =
      AsyncAction('_BaseControllerControllerBase._executor');

  @override
  Future<void> _executor<PARAM, RESULT>(
      PARAM param, IUseCase<PARAM, RESULT> usecase,
      {void Function(RESULT) onSuccess, String Function(String) onError}) {
    return _$_executorAsyncAction.run(() => super._executor<PARAM, RESULT>(
        param, usecase,
        onSuccess: onSuccess, onError: onError));
  }

  final _$execAsyncAction = AsyncAction('_BaseControllerControllerBase.exec');

  @override
  Future<void> exec<PARAM, RESULT>(PARAM param, IUseCase<PARAM, RESULT> usecase,
      {void Function(RESULT) onSuccess,
      String Function(String) onError,
      Duration waitIfHaveMoreCalls}) {
    return _$execAsyncAction.run(() => super.exec<PARAM, RESULT>(param, usecase,
        onSuccess: onSuccess,
        onError: onError,
        waitIfHaveMoreCalls: waitIfHaveMoreCalls));
  }

  final _$_BaseControllerControllerBaseActionController =
      ActionController(name: '_BaseControllerControllerBase');

  @override
  void setShowLoadin(bool value) {
    final _$actionInfo = _$_BaseControllerControllerBaseActionController
        .startAction(name: '_BaseControllerControllerBase.setShowLoadin');
    try {
      return super.setShowLoadin(value);
    } finally {
      _$_BaseControllerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setErroMessage(String value) {
    final _$actionInfo = _$_BaseControllerControllerBaseActionController
        .startAction(name: '_BaseControllerControllerBase.setErroMessage');
    try {
      return super.setErroMessage(value);
    } finally {
      _$_BaseControllerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
showLoading: ${showLoading},
errorMessage: ${errorMessage}
    ''';
  }
}

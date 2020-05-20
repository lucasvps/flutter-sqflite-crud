// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppController on _AppControllerBase, Store {
  final _$darkStatusAtom = Atom(name: '_AppControllerBase.darkStatus');

  @override
  bool get darkStatus {
    _$darkStatusAtom.reportRead();
    return super.darkStatus;
  }

  @override
  set darkStatus(bool value) {
    _$darkStatusAtom.reportWrite(value, super.darkStatus, () {
      super.darkStatus = value;
    });
  }

  final _$_AppControllerBaseActionController =
      ActionController(name: '_AppControllerBase');

  @override
  dynamic changeTheme() {
    final _$actionInfo = _$_AppControllerBaseActionController.startAction(
        name: '_AppControllerBase.changeTheme');
    try {
      return super.changeTheme();
    } finally {
      _$_AppControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
darkStatus: ${darkStatus}
    ''';
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_theme_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ChangeThemeStore on _ChangeThemeStoreBase, Store {
  final _$darkStatusAtom = Atom(name: '_ChangeThemeStoreBase.darkStatus');

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

  final _$_ChangeThemeStoreBaseActionController =
      ActionController(name: '_ChangeThemeStoreBase');

  @override
  dynamic changeTheme() {
    final _$actionInfo = _$_ChangeThemeStoreBaseActionController.startAction(
        name: '_ChangeThemeStoreBase.changeTheme');
    try {
      return super.changeTheme();
    } finally {
      _$_ChangeThemeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
darkStatus: ${darkStatus}
    ''';
  }
}

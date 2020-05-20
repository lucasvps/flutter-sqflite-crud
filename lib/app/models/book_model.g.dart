// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BookModel on _BookModelBase, Store {
  Computed<bool> _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_BookModelBase.isFormValid'))
          .value;

  final _$nameAtom = Atom(name: '_BookModelBase.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$authorAtom = Atom(name: '_BookModelBase.author');

  @override
  String get author {
    _$authorAtom.reportRead();
    return super.author;
  }

  @override
  set author(String value) {
    _$authorAtom.reportWrite(value, super.author, () {
      super.author = value;
    });
  }

  final _$pagesAtom = Atom(name: '_BookModelBase.pages');

  @override
  String get pages {
    _$pagesAtom.reportRead();
    return super.pages;
  }

  @override
  set pages(String value) {
    _$pagesAtom.reportWrite(value, super.pages, () {
      super.pages = value;
    });
  }

  final _$pagesReadAtom = Atom(name: '_BookModelBase.pagesRead');

  @override
  String get pagesRead {
    _$pagesReadAtom.reportRead();
    return super.pagesRead;
  }

  @override
  set pagesRead(String value) {
    _$pagesReadAtom.reportWrite(value, super.pagesRead, () {
      super.pagesRead = value;
    });
  }

  final _$_BookModelBaseActionController =
      ActionController(name: '_BookModelBase');

  @override
  dynamic setName(String value) {
    final _$actionInfo = _$_BookModelBaseActionController.startAction(
        name: '_BookModelBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_BookModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setAuthor(String value) {
    final _$actionInfo = _$_BookModelBaseActionController.startAction(
        name: '_BookModelBase.setAuthor');
    try {
      return super.setAuthor(value);
    } finally {
      _$_BookModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPages(String value) {
    final _$actionInfo = _$_BookModelBaseActionController.startAction(
        name: '_BookModelBase.setPages');
    try {
      return super.setPages(value);
    } finally {
      _$_BookModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPagesRead(String value) {
    final _$actionInfo = _$_BookModelBaseActionController.startAction(
        name: '_BookModelBase.setPagesRead');
    try {
      return super.setPagesRead(value);
    } finally {
      _$_BookModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
author: ${author},
pages: ${pages},
pagesRead: ${pagesRead},
isFormValid: ${isFormValid}
    ''';
  }
}

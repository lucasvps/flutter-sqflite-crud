// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$booksListAtom = Atom(name: '_HomeControllerBase.booksList');

  @override
  List<BookModel> get booksList {
    _$booksListAtom.reportRead();
    return super.booksList;
  }

  @override
  set booksList(List<BookModel> value) {
    _$booksListAtom.reportWrite(value, super.booksList, () {
      super.booksList = value;
    });
  }

  @override
  String toString() {
    return '''
booksList: ${booksList}
    ''';
  }
}

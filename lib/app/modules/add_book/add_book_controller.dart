import 'package:crud_sqflite/app/app_controller.dart';
import 'package:crud_sqflite/app/models/book_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'add_book_controller.g.dart';

class AddBookController = _AddBookControllerBase with _$AddBookController;

abstract class _AddBookControllerBase with Store {
  var book = BookModel();

  final db = Modular.get<AppController>();


  String validateNameController() {
    return book.validateName();
  }

  String validateAuthorController() {
    return book.validateAuthor();
  }

  String validatePagesController() {
    return book.validatePages();
  }

  String validatePagesReadController() {
    return book.validatePagesRead();
  }

  validateForm() {
    return book.isFormValid;
  }
}

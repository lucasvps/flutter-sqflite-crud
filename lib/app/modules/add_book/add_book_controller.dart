import 'package:crud_sqflite/app/models/book_model.dart';
import 'package:mobx/mobx.dart';

part 'add_book_controller.g.dart';

class AddBookController = _AddBookControllerBase with _$AddBookController;

abstract class _AddBookControllerBase with Store {
  var book = BookModel();


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

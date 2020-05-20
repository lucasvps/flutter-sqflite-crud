import 'package:crud_sqflite/app/app_controller.dart';
import 'package:crud_sqflite/app/components/widgets.dart';
import 'package:crud_sqflite/app/db/db_helper.dart';
import 'package:crud_sqflite/app/models/book_model.dart';
import 'package:crud_sqflite/app/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'add_book_controller.dart';

class AddBookPage extends StatefulWidget {
  final String title;
  final String id;
  final String name;
  final String author;
  final String pages;
  final String pagesRead;
  const AddBookPage(
      {Key key,
      this.title = "AddBook",
      this.name,
      this.author,
      this.pages,
      this.pagesRead,
      this.id})
      : super(key: key);

  @override
  _AddBookPageState createState() => _AddBookPageState();
}

class _AddBookPageState extends ModularState<AddBookPage, AddBookController> {
  //use 'controller' variable to access controller

  var _db = DatabaseHelper();

  bool isEdition = false;
  var idEdition;

  @override
  void initState() {
    super.initState();
    paramsEdition();
    idEdition = widget.id;
    if (paramsEdition()) {
      isEdition = true;
    }
  }

  bool paramsEdition() {
    if (widget.name != null) {
      controller.book.setName(widget.name);
    } else {
      return false;
    }
    if (widget.author != null) {
      controller.book.setAuthor(widget.author);
    } else {
      return false;
    }
    if (widget.pages != null) {
      controller.book.setPages(widget.pages);
    } else {
      return false;
    }
    if (widget.pagesRead != null) {
      controller.book.setPagesRead(widget.pagesRead);
    } else {
      return false;
    }
    return true;
  }

  // Widget _customTextField(
  //     {String text,
  //     onChanged,
  //     String Function() errorText,
  //     String initualValue}) {
  //   return Padding(
  //     padding: const EdgeInsets.all(8.0),
  //     child: TextFormField(
  //       initialValue: initualValue,
  //       keyboardType:
  //           text.contains('Number') ? TextInputType.number : TextInputType.text,
  //       decoration: InputDecoration(
  //           border: OutlineInputBorder(),
  //           labelText: text,
  //           errorText: errorText()),
  //       onChanged: onChanged,
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          isEdition ? "Editing : ${widget.name}" : 'New Book',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Observer(
            builder: (_) {
              return Column(
                children: <Widget>[
                  CustomWidget.customTextField(
                      text: "Book's name",
                      onChanged: controller.book.setName,
                      errorText: controller.validateNameController,
                      initualValue: controller.book.name),
                  CustomWidget.customTextField(
                      text: "Author's name",
                      onChanged: controller.book.setAuthor,
                      errorText: controller.validateAuthorController,
                      initualValue: controller.book.author),
                  CustomWidget.customTextField(
                      text: "Number of pages",
                      onChanged: controller.book.setPages,
                      errorText: controller.validatePagesController,
                      initualValue: controller.book.pages),
                  CustomWidget.customTextField(
                      text: "Number of pages readen",
                      onChanged: controller.book.setPagesRead,
                      errorText: controller.validatePagesReadController,
                      initualValue: controller.book.pagesRead),
                  RaisedButton(
                    color: Theme.of(context).buttonColor,
                    onPressed: isEdition && controller.validateForm()
                        ? () {
                            BookModel edited = BookModel(
                                id: int.parse(idEdition),
                                name: controller.book.name,
                                author: controller.book.author,
                                pages: controller.book.pages,
                                pagesRead: controller.book.pagesRead,
                                isFavorite: 0);

                            _db.update(edited);
                            _db.fetchAllBooks().then((list) {
                              Modular.get<HomeController>().booksList = list;
                              Modular.to.pushNamedAndRemoveUntil(
                                  '/', ModalRoute.withName('/'));
                            });
                          }
                        : controller.validateForm()
                            ? () {
                                BookModel book = BookModel(
                                    name: controller.book.name,
                                    author: controller.book.author,
                                    pages: controller.book.pages,
                                    pagesRead: controller.book.pagesRead,
                                    isFavorite: 0);

                                _db.newBook(book);
                                _db.fetchAllBooks().then((list) {
                                  Modular.get<HomeController>().booksList =
                                      list;
                                  Modular.to.pushNamedAndRemoveUntil(
                                      '/', ModalRoute.withName('/'));
                                });
                              }
                            : null,
                    child: Text('Confirm', style: TextStyle(color: Modular.get<AppController>().darkStatus ? Colors.black : Colors.white),)
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

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
  const AddBookPage({Key key, this.title = "AddBook"}) : super(key: key);

  @override
  _AddBookPageState createState() => _AddBookPageState();
}

class _AddBookPageState extends ModularState<AddBookPage, AddBookController> {
  //use 'controller' variable to access controller

  var _db = DatabaseHelper();

  Widget _customTextField(String text, onChanged, String Function() errorText) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        keyboardType:
            text.contains('Number') ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: text,
            errorText: errorText()),
        onChanged: onChanged,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Observer(
            builder: (_) {
              return Column(
                children: <Widget>[
                  _customTextField("Book's name", controller.book.setName,
                      controller.validateNameController),
                  _customTextField("Author's name", controller.book.setAuthor,
                      controller.validateAuthorController),
                  _customTextField("Number of pages", controller.book.setPages,
                      controller.validatePagesController),
                  _customTextField(
                      "Number of pages readen",
                      controller.book.setPagesRead,
                      controller.validatePagesReadController),
                  RaisedButton(
                    onPressed: controller.validateForm()
                        ? () {
                            BookModel book = BookModel(
                                name: controller.book.name,
                                author: controller.book.author,
                                pages: controller.book.pages,
                                pagesRead: controller.book.pagesRead,
                                isFavorite: 0);

                            _db.newBook(book);
                            _db.fetchAllBooks().then((list) {
                              Modular.get<HomeController>().booksList = list;
                              Modular.to.pushNamed('/');
                            });
                          }
                        : null,
                    child: Text('Confirm'),
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

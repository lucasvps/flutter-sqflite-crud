import 'package:crud_sqflite/app/app_controller.dart';
import 'package:crud_sqflite/app/components/widgets.dart';
import 'package:crud_sqflite/app/db/db_helper.dart';
import 'package:crud_sqflite/app/entities/book_entity.dart';
import 'package:crud_sqflite/app/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
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
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

  bool isEdition = false;
  var idEdition;

  @override
  void initState() {
    super.initState();
    controller.book.pages = '0';
    controller.book.pagesRead = '0';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          isEdition ? "Editing : ${widget.name}" : 'New Book',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
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
                    controller.book.pages.isNotEmpty
                        ? CustomWidget.customTextField(
                            text: "Number of pages read",
                            onChanged: controller.book.setPagesRead,
                            errorText: controller.validatePagesReadController,
                            initualValue: controller.book.pagesRead)
                        : Container(),
                    RaisedButton(
                        color: Theme.of(context).buttonColor,
                        onPressed: isEdition && controller.validateForm()
                            ? () {
                                BookEntity edited = BookEntity(
                                  id: int.parse(idEdition),
                                  name: controller.book.name,
                                  author: controller.book.author,
                                  pages: controller.book.pages,
                                  pagesRead: controller.book.pagesRead,
                                );

                                Modular.get<AppController>()
                                    .db
                                    .bookRepositoryDAO
                                    .updateItem(edited);
                                CustomWidget.showSnackBar(
                                    isEdition
                                        ? "Book successfully edited"
                                        : 'Book successfully added',
                                    Colors.green,
                                    _scaffoldkey);
                                Future.delayed(Duration(seconds: 2))
                                    .then((value) {
                                  _db.fetchAllBooks().then((list) {
                                    Modular.get<HomeController>().booksList =
                                        list;
                                    Modular.to.pushNamedAndRemoveUntil(
                                        '/', ModalRoute.withName('/'));
                                  });
                                });
                              }
                            : controller.validateForm()
                                ? () {
                                    BookEntity book = BookEntity(
                                      name: controller.book.name,
                                      author: controller.book.author,
                                      pages: controller.book.pages,
                                      pagesRead: controller.book.pagesRead,
                                    );

                                    Modular.get<AppController>()
                                        .db
                                        .bookRepositoryDAO
                                        .insertItem(book);
                                    CustomWidget.showSnackBar(
                                        isEdition
                                            ? "Book successfully edited"
                                            : 'Book successfully added',
                                        Colors.green,
                                        _scaffoldkey);
                                    Future.delayed(Duration(seconds: 2))
                                        .then((value) {
                                      _db.fetchAllBooks().then((list) {
                                        Modular.get<HomeController>()
                                            .booksList = list;
                                        Modular.to.pushNamedAndRemoveUntil(
                                            '/', ModalRoute.withName('/'));
                                      });
                                    });
                                  }
                                : null,
                        child: Text(
                          'Confirm',
                          style: TextStyle(
                              color: Modular.get<AppController>().darkStatus
                                  ? Colors.black
                                  : Colors.white),
                        )),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

import 'dart:io';

import 'package:crud_sqflite/app/models/book_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  String booksTable = 'books';
  String colId = 'id';
  String colName = 'name';
  String colAuthor = 'author';
  String colPages = 'pages';
  String colPagesRead = 'pagesRead';
  String colIsFavorite = 'isFavorite';

  static DatabaseHelper _databaseHelper; // Singleton.

  static Database
      _database; //Instancia privada, apenas uma instancia pro código todo.

  // construtor nomeado para instancia.
  DatabaseHelper._createInstance();

  //Cosntrutor verifica se a instancia ja existe ou nao. Se nao existe, cria ela.
  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance();
    }

    return _databaseHelper;
  }

  // Recupera o banco
  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }

    return _database;
  }

  // Inicializa o banco
  Future<Database> initializeDatabase() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + 'books-sqflite.db';
    //print(path);

    var favoritesDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return favoritesDatabase;
  }

  // Cria o banco em si
  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $booksTable($colId INTEGER PRIMARY KEY autoincrement , $colName TEXT, $colAuthor TEXT, $colPages TEXT, $colPagesRead TEXT, $colIsFavorite INTEGER)'); //, $colThumbnail TEXT
  }

  // Adicionar objeto no banco
  Future<int> newBook(BookModel book) async {
    Database db = await this.database;

    try {
      var result = await db.insert(booksTable, book.toMap());

      return result;
    } catch (e) {
      return 0;
    }
  }

  // Remover objeto do banco
  Future removeBook(BookModel book) async {
    Database db = await this.database;

    var result =
        await db.rawDelete('DELETE FROM $booksTable WHERE $colId = ${book.id}');
    return result;
  }

  // Atualizar objeto do banco
  Future<int> update(BookModel book) async {
    Database db = await this.database;
    return await db.update(booksTable, book.toMap(),
        where: '$colId = ?', whereArgs: [book.id]);
  }

  // Buscar todos os objetos do banco
  Future<List<BookModel>> fetchAllBooks() async {
    Database db = await this.database;

    var result = await db.query(booksTable);
    List<BookModel> books = result.isNotEmpty
        ? result.map((f) => BookModel.fromMap(f)).toList()
        : [];

    return books;
  }

  Future close() async {
    Database db = await this.database;
    db.close();
  }
}

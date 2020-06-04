import 'package:crud_sqflite/app/db/db_floor.dart';
import 'package:crud_sqflite/app/db/db_helper.dart';
import 'package:crud_sqflite/app/entities/book_entity.dart';
import 'package:crud_sqflite/app/models/book_model.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  var _db = DatabaseHelper();

  final AppDatabase floorDatabase;
  _HomeControllerBase({this.floorDatabase});
  

  @observable
  List<BookModel> booksList = [];

  @observable
  List<BookEntity> bookListEntity = [];

  


  Future<List<BookModel>> listOfBooks() async {
    return await _db.fetchAllBooks();
  }
  

  
}

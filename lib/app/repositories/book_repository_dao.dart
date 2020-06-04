import 'package:crud_sqflite/app/entities/book_entity.dart';
import 'package:crud_sqflite/app/interfaces/book_repository_dao_interface.dart';
import 'package:floor/floor.dart';

@dao
abstract class BookRepositoryDAO extends IBookRepositoryDAO<BookEntity> {

  @Query('SELECT * FROM Books')
  Future<List<BookEntity>> getAllBooks();

}

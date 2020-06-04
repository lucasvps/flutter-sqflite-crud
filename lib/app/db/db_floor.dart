import 'package:crud_sqflite/app/entities/book_entity.dart';
import 'package:crud_sqflite/app/repositories/book_repository_dao.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';

part 'db_floor.g.dart'; // the generated code will be there

@Database(version: 1, entities: [BookEntity])
abstract class AppDatabase extends FloorDatabase {
  BookRepositoryDAO get bookRepositoryDAO;
}

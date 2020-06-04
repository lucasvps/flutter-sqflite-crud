import 'package:floor/floor.dart';

abstract class IBookRepositoryDAO<Table> {

  @insert
  Future<int> insertItem(Table item);

  @update
  Future<int> updateItem(Table item);

  @delete
  Future<int> deleteItem(Table item);


}
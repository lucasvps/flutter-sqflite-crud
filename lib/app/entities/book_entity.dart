import 'package:floor/floor.dart';

@Entity(tableName: 'books')
class BookEntity {
  
  @PrimaryKey(autoGenerate: true)
  final int id;
  
  final String name;
  final String author;
  final String pages;
  final String pagesRead;

  BookEntity({this.id, this.name, this.author, this.pages, this.pagesRead});




}
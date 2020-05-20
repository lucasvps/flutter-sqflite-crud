import 'package:mobx/mobx.dart';

part 'book_model.g.dart';

class BookModel = _BookModelBase with _$BookModel;

abstract class _BookModelBase with Store {
  int id;

  @observable
  String name;

  @action
  setName(String value) => name = value;

  @observable
  String author;
  @action
  setAuthor(String value) => author = value;

  @observable
  String pages;
  @action
  setPages(String value) => pages = value;

  @observable
  String pagesRead;
  @action
  setPagesRead(String value) => pagesRead = value;

  int isFavorite;

  String validateName() {
    if (name == null || name.isEmpty) {
      return 'This field is required';
    }

    return null;
  }

  String validateAuthor() {
    if (author == null || author.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  String validatePages() {
    if (pages == null || pages.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  String validatePagesRead() {
    if (pagesRead == null || pagesRead.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  @computed
  bool get isFormValid {
    return validateName() == null &&
        validateAuthor() == null &&
        validatePages() == null &&
        validatePagesRead() == null;
  }

  _BookModelBase(
      {this.id,
      this.name,
      this.author,
      this.pages,
      this.pagesRead,
      this.isFavorite});

  _BookModelBase.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    author = map['author'];
    isFavorite = map['isFavorite'];
    pages = map['pages'];
    pagesRead = map['pagesRead'];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'name': name,
      'author': author,
      'isFavorite': isFavorite,
      'pages': pages,
      'pagesRead': pagesRead
    };

    return map;
  }
}

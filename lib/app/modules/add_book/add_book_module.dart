import 'package:crud_sqflite/app/modules/add_book/add_book_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:crud_sqflite/app/modules/add_book/add_book_page.dart';

class AddBookModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AddBookController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => AddBookPage()),
      ];

  static Inject get to => Inject<AddBookModule>.of();
}

import 'package:crud_sqflite/app/db/db_floor.dart';
import 'package:crud_sqflite/app/modules/add_book/add_book_controller.dart';
import 'package:crud_sqflite/app/modules/add_book/add_book_module.dart';
import 'package:crud_sqflite/app/modules/add_book/add_book_page.dart';
import 'package:crud_sqflite/app/modules/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:crud_sqflite/app/modules/home/home_page.dart';

class HomeModule extends ChildModule {
  final AppDatabase floorDatabase;
  HomeModule(this.floorDatabase);

  @override
  List<Bind> get binds =>
      [Bind((i) => HomeController(floorDatabase: floorDatabase)), Bind((i) => AddBookController())];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => HomePage()),
        Router('/add-book', module: AddBookModule()),
        Router('/edit-book/:id/:name/:author/:pages/:pagesRead',
            child: (_, args) => AddBookPage(
                  id: args.params['id'],
                  name: args.params['name'],
                  author: args.params['author'],
                  pages: args.params['pages'],
                  pagesRead: args.params['pagesRead'],
                ))
      ];

  static Inject get to => Inject<HomeModule>.of();
}

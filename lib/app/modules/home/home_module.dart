import 'package:crud_sqflite/app/modules/add_book/add_book_controller.dart';
import 'package:crud_sqflite/app/modules/add_book/add_book_module.dart';
import 'package:crud_sqflite/app/modules/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:crud_sqflite/app/modules/home/home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController()),
        
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => HomePage()),
        Router('/add-book', module: AddBookModule())
      ];

  static Inject get to => Inject<HomeModule>.of();
}

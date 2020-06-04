import 'package:crud_sqflite/app/app_controller.dart';
import 'package:crud_sqflite/app/db/db_floor.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:crud_sqflite/app/app_widget.dart';
import 'package:crud_sqflite/app/modules/home/home_module.dart';

class AppModule extends MainModule {
  
  final AppDatabase db;

  AppModule({this.db});

  @override
  List<Bind> get binds => [
        Bind((i) => AppController(db: db)),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: HomeModule(db)),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}

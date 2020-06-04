import 'package:crud_sqflite/app/db/db_floor.dart';
import 'package:flutter/material.dart';
import 'package:crud_sqflite/app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ModularApp(
      module: AppModule(
    db: await $FloorAppDatabase.databaseBuilder('db_floor.db').build(),
  )));
}

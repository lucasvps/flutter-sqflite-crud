import 'package:crud_sqflite/app/db/db_floor.dart';
import 'package:mobx/mobx.dart';

part 'app_controller.g.dart';

class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {

  final AppDatabase db;
  _AppControllerBase({this.db});


  @observable
  bool darkStatus = false;

  

  @action
  changeTheme(){
    darkStatus = !darkStatus;
  }
}

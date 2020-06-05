import 'package:crud_sqflite/app/db/db_floor.dart';
import 'package:crud_sqflite/app/stores/change_theme_store.dart';
import 'package:mobx/mobx.dart';

part 'app_controller.g.dart';

class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {
  final ChangeThemeStore changeThemeStore;
  final AppDatabase db;

  _AppControllerBase(this.changeThemeStore, {this.db}) {
    changeThemeStore.iSharedLocalStorage.get('isDark').then((value) {
      if (value != null) changeThemeStore.darkStatus = value;
    });
  }

  changeDarkStatus() => changeThemeStore.changeTheme();

  bool get darkStatus => changeThemeStore.darkStatus;
}

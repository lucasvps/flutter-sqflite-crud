import 'package:crud_sqflite/app/interfaces/shared_local_storage_interface.dart';
import 'package:mobx/mobx.dart';

part 'change_theme_store.g.dart';

class ChangeThemeStore = _ChangeThemeStoreBase with _$ChangeThemeStore;

abstract class _ChangeThemeStoreBase with Store {
  final ISharedLocalStorage iSharedLocalStorage;
  _ChangeThemeStoreBase(this.iSharedLocalStorage);
  
  @observable
  bool darkStatus = false;

  @action
  changeTheme() {
    darkStatus = !darkStatus;
    iSharedLocalStorage.put('isDark', darkStatus);
  }
}

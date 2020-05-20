import 'package:crud_sqflite/app/app_controller.dart';
import 'package:crud_sqflite/app/themes/dark_theme.dart';
import 'package:crud_sqflite/app/themes/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: Modular.navigatorKey,
        title: 'Flutter Slidy',
        theme: Modular.get<AppController>().darkStatus
            ? AppThemeDark().getTheme()
            : AppThemeLight().getTheme(),
        initialRoute: '/',
        onGenerateRoute: Modular.generateRoute,
      );
    });
  }
}

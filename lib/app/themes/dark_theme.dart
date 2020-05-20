import 'package:crud_sqflite/app/interfaces/theme_app_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/theme_data.dart';


class AppThemeDark extends IThemeAppInterface{

  @override
  ThemeData getTheme() {
    // Implementar temas especializados.
    return ThemeData(
      brightness: Brightness.dark,

      
      //primaryColor: Colors.black54,
      primaryColorDark: Colors.black,

      // Cards
      cardTheme: CardTheme(
        color: Colors.black54
      ),

      // Buttons
      buttonColor: Colors.white,
      

      //App Bar
      appBarTheme: AppBarTheme(
        textTheme: TextTheme(
          headline6: TextStyle(
            fontSize: 30
          )
        ),

        //Icons
        iconTheme: IconThemeData(
          //size: 80,
          color: Colors.white
        )
      )
    );
  }

}
import 'package:crud_sqflite/app/interfaces/theme_app_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/theme_data.dart';


class AppThemeLight extends IThemeAppInterface{

  @override
  ThemeData getTheme() {
    // Implementar temas especializados.
    return ThemeData(
      brightness: Brightness.light,

      

      
      primaryColor: Colors.black,
      
      

      // Cards
      cardTheme: CardTheme(
        color: Colors.white60
      ),

      // Buttons
      buttonColor: Colors.black,

      //App Bar
      appBarTheme: AppBarTheme(
        color: Colors.grey[200],
        textTheme: TextTheme(
          headline6: TextStyle(
            color: Colors.black,
            fontSize: 30
          )
        ),

        //Icons
        iconTheme: IconThemeData(
          color: Colors.black
        )
      )
    );
  }

}
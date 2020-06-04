import 'package:crud_sqflite/app/app_controller.dart';
import 'package:crud_sqflite/app/db/db_helper.dart';
import 'package:crud_sqflite/app/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustomWidget {

  

  static customTextField(
      {String text,
      onChanged,
      String Function() errorText,
      String initualValue}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        initialValue: initualValue,
        keyboardType:
            text.contains('Number') ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: text,
            errorText: errorText()),
        onChanged: onChanged,
      ),
    );
  }

  static Future<void> showSnackBar(String text, Color color, key) {
    final snackContent = SnackBar(
      content: Text(
        text,
        textAlign: TextAlign.center,
      ),
      duration: Duration(seconds: 2),
      backgroundColor: color,
    );
    key.currentState.showSnackBar(snackContent);
  }

  static Future alert(context, title, content, key, deletedBook) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return AlertDialog(
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Modular.get<AppController>().db.bookRepositoryDAO.deleteItem(deletedBook);
                    
                    showSnackBar('Book successfully deleted', Colors.red, key);
                    //Navigator.of(context).pop();
                    Modular.to.pushReplacementNamed('/');
                  },
                  child: Text("Delete")),
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Cancel")),
            ],
            title: Text(title),
            content: Container(child: Text(content)),
          );
        });
  }
}

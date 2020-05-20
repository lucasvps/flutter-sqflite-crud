import 'package:flutter/material.dart';

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
}
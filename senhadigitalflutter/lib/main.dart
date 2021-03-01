import 'package:flutter/material.dart';
import 'package:senhadigitalflutter/telaprincipal.dart';

void main() {
  runApp(MaterialApp(
    home: TelaPrincipal(),
    theme: ThemeData(
      primaryColor: Colors.blue,
      hintColor: Colors.white,
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      ),
    ),
    debugShowCheckedModeBanner: false,
  ));
}



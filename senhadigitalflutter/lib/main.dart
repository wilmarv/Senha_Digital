import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:senhadigitalflutter/telalogin.dart';

void main() {
  runApp(MaterialApp(
    home: Login(),
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

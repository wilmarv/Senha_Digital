import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:senhadigitalflutter/model/usuario_model.dart';
import 'package:senhadigitalflutter/telas/tela_admfila.dart';
import 'package:senhadigitalflutter/telas/tela_login.dart';
void main() async{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ScopedModel<Usuario>(
        model: Usuario(),
        child: MaterialApp(
          home: TelaLogin(),
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
        ),
      ),
    );
  }
}



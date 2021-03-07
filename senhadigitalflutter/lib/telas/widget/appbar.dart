import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:senhadigitalflutter/model/usuario_model.dart';
import 'package:senhadigitalflutter/telas/tela_login.dart';

Widget AppBarPadrao(){
  return AppBar(
    title: Text("Senha Digital",
        style: TextStyle(fontSize: 23, fontStyle: FontStyle.italic)),
    shadowColor: Colors.blue,
    actions: [
      ScopedModelDescendant<Usuario>(
          builder: (context,child,model){
            return model.conectado() ? IconButton(icon: Icon(Icons.exit_to_app_outlined), onPressed: (){
              model.Desconect();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context)=>TelaLogin())
              );
            }): Container();
          }
          )
    ],
  );
}

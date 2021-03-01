import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

 Widget appBar(FirebaseUser user){
   print(user.email);
  return AppBar(
    title: Text("Senha Digital",
      style: TextStyle(fontSize: 23,fontStyle: FontStyle.italic)
    ),
    shadowColor: Colors.blue,
    actions: [
      user != null ? IconButton(
          icon: Icon(Icons.exit_to_app),
          onPressed: (){

          }
      ): null
    ],

  );
}
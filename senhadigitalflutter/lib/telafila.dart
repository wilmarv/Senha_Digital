import 'package:flutter/material.dart';
class Fila extends StatefulWidget {
  @override
  _FilaState createState() => _FilaState();
}

class _FilaState extends State<Fila> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Senha Digital",
            style: TextStyle(fontSize: 23, fontStyle: FontStyle.italic)),
        centerTitle: true,
        shadowColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(25),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(10)),
              child: Text("ola"),
            ),
          ),
        ),
      ),
    );;
  }
}

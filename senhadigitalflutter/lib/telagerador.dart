import 'package:flutter/material.dart';


class Gerador extends StatefulWidget {
  @override
  _GeradorState createState() => _GeradorState();
}

class _GeradorState extends State<Gerador> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          padding: EdgeInsets.all(25),
          child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10)),
              child: Text("teste")
          ),
        ),
      ),
    );
  }
}


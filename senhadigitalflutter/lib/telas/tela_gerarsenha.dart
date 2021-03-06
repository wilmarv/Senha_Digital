import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:senhadigitalflutter/telas/tela_statusfila.dart';
import 'package:senhadigitalflutter/telas/widget/appbar.dart';

class GerarSenha extends StatefulWidget {
  @override
  _GerarSenhaState createState() => _GerarSenhaState();
}

class _GerarSenhaState extends State<GerarSenha> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPadrao(),
      backgroundColor: Colors.white,
      body: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection("fila").snapshots(),
        // ignore: missing_return
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            default:
              List<DocumentSnapshot> document =
                  snapshot.data.documents.toList();
              int _tamanhofila = document.length;
              return Padding(
                  padding: EdgeInsets.all(20),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        Text("Pessoas aguardando :",
                            style: TextStyle(
                                color: Colors.white,
                                fontStyle: FontStyle.italic,
                                fontSize: 25)),
                        Divider(),
                        Container(
                            width: 200,
                            height: 65,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: const Color(0xffffffff),
                              border: Border.all(
                                width: 3,
                                color: Colors.blue,
                              ),
                            ),
                            child: Column(
                              children: [
                                Text(_tamanhofila.toString(),
                                    style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontSize: 50)),
                              ],
                            )),
                        Divider(),
                        Container(
                          width: 300,
                          height: 60,
                          padding: EdgeInsets.all(0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white30, width: 8),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: RaisedButton(
                              child: Text("Entrar na Fila",
                                  style: TextStyle(color: Colors.black)),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> StatusFila()));
                              }),
                        )
                      ],
                    ),
                  ));
          }
        },
      ),
    );
  }
}

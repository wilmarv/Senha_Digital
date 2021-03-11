import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:senhadigitalflutter/model/usuario_model.dart';

class StatusFila extends StatefulWidget {
  @override
  _StatusFilaState createState() => _StatusFilaState();
}

class _StatusFilaState extends State<StatusFila> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Senha Digital",
            style: TextStyle(fontSize: 23, fontStyle: FontStyle.italic)),
        centerTitle: true,
        shadowColor: Colors.blue,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection("fila").orderBy("pos").snapshots(),
        builder: (context,snapshot){
          switch(snapshot.connectionState){
            case ConnectionState.waiting:
            case ConnectionState.none:
              return Center(child: CircularProgressIndicator());
            default:
              return Center(
                child: Container(
                  padding: EdgeInsets.all(25),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.blue, borderRadius: BorderRadius.circular(10)),
                    child: Column(children: [
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xffffffff),
                          border: Border.all(
                            width: 5,
                            color: Colors.blue,
                          ),
                        ),
                        child: Column(
                          children: <Widget>[
                            Divider(color: Colors.transparent),
                            Text(
                              "${snapshot.data.documents[0].data["atual"]}",
                              style: TextStyle(fontSize: 50),
                            ),
                            Text(
                              "Senha Atual",
                              style: TextStyle(
                                  fontSize: 20, fontStyle: FontStyle.italic),
                            ),
                            Text(
                              "${snapshot.data.documents[0].data["guinche"]}",
                              style: TextStyle(fontSize: 50),
                            ),
                            Text(
                              "Guiche",
                              style: TextStyle(
                                  fontSize: 20, fontStyle: FontStyle.italic),
                            ),
                          ],
                        ),
                      ),
                      Divider(color: Colors.transparent),
                      Container(
                        width: 250,
                        decoration: BoxDecoration(
                          color: const Color(0xffffffff),
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            width: 5,
                            color: Colors.blue,
                          ),
                        ),
                        child: Column(
                          children: <Widget>[
                            Text(
                              "${Usuario.of(context).senha}",
                              style: TextStyle(fontSize: 50),
                            ),
                            Text(
                              "Sua senha",
                              style: TextStyle(
                                  fontSize: 20, fontStyle: FontStyle.italic),
                            ),
                          ],
                        ),
                      ),
                      Divider(color: Colors.transparent),
                      Divider(color: Colors.transparent),
                      Row(
                        children: <Widget>[
                          Container(
                            color: Colors.white,
                            width: 140,
                            height: 85,
                            child: Column(
                              children: <Widget>[
                                Text(
                                  "${snapshot.data.documents[0].data["antsenha"]}",
                                  style: TextStyle(fontSize: 50),
                                ),
                                Text(
                                  "Senha anterior",
                                  style: TextStyle(
                                      fontSize: 20, fontStyle: FontStyle.italic),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Container(
                              color: Colors.white,
                              width: 140,
                              height: 85,
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    "${snapshot.data.documents[0].data["antguinche"]}",
                                    style: TextStyle(fontSize: 50),
                                  ),
                                  Text(
                                    "Guiche",
                                    style: TextStyle(
                                        fontSize: 20, fontStyle: FontStyle.italic),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ]),
                  ),
                ),
              );
          }
        },
      ),
    );
  }
}

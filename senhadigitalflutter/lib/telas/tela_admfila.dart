import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:senhadigitalflutter/telas/widget/appbar.dart';
import 'package:senhadigitalflutter/telas/widget/lista_fila.dart';

class AdmFila extends StatefulWidget {
  @override
  _AdmFilaState createState() => _AdmFilaState();
}

class _AdmFilaState extends State<AdmFila> {
  final _scaffold = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key:_scaffold ,
      appBar: AppBarPadrao(),
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Container(
            width: 400,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Colors.blue,
                border: Border.all(width: 1.5, style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(top: 4),
                    decoration: BoxDecoration(
                        color: Colors.white60,
                        border:
                            Border.all(width: 1.5, style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 89,
                                child: Text(
                                  "Senha",
                                  style: TextStyle(fontSize: 20),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                width: 89,
                                child: Text(
                                  "Nome",
                                  style: TextStyle(fontSize: 20),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                width: 89,
                                child: Text(
                                  "Matricula",
                                  style: TextStyle(fontSize: 20),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(child: Lista()),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.all(0),
                      width: 85,
                      child: RaisedButton(
                        onPressed: () async {
                          QuerySnapshot doc = await Firestore.instance
                              .collection("fila")
                              .orderBy("senha")
                              .getDocuments();
                          if(doc.documents.length <= 2){
                            _scaffold.currentState.showSnackBar(
                                SnackBar(content: Text("Fim da fila no momento!"))
                            );
                          }else {
                            await Firestore.instance
                                .collection("fila")
                                .document(doc.documents[0].documentID)
                                .delete();
                          }
                        },
                        child: Text("Proximo"),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget Lista() {
  return StreamBuilder<QuerySnapshot>(
    stream: Firestore.instance.collection("fila").orderBy("senha").snapshots(),
    builder: (context, snapshot) {
      switch (snapshot.connectionState) {
        case ConnectionState.waiting:
        case ConnectionState.none:
          return Center(child: CircularProgressIndicator());
        default:
          List<DocumentSnapshot> doc = snapshot.data.documents;
          return ListaFila(doc);
      }
    },
  );
}

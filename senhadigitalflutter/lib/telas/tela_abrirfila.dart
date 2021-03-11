import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:senhadigitalflutter/model/usuario_model.dart';
import 'package:senhadigitalflutter/telas/tela_admfila.dart';
import 'package:senhadigitalflutter/telas/widget/appbar.dart';
import 'package:senhadigitalflutter/telas/widget/textfield.dart';
class AbrirFila extends StatelessWidget {

  final _caixaController = TextEditingController();
  final _globalkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPadrao(),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10)),
              child:Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Olá, ${Usuario.of(context).Dados()["nome"]}",style: TextStyle(fontSize: 25,color: Colors.white),),
                    Text("Escolha seu guiche para abrir a fila:",style: TextStyle(fontSize: 25,color: Colors.white),),
                    Divider(color: Colors.transparent),
                    Form(
                        key: _globalkey,
                        child: TextFieldPadrao(controller: _caixaController, type: TextInputType.number, label:"Guiche", hide: false)
                    ),
                    Divider(color: Colors.transparent),
                    Container(
                      width: 300,
                      height: 60,
                      padding: EdgeInsets.all(0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white30, width: 8),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: RaisedButton(
                          child: Text("Abrir Fila",
                              style: TextStyle(color: Colors.black)),
                          onPressed: () {
                            if(_globalkey.currentState.validate()) {
                              Firestore.instance.collection("aberto").document(Usuario.of(context).Dados()["nome"]).setData({});
                              Usuario.of(context).guiche = int.parse(_caixaController.text);
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => AdmFila()));
                              }
                            }),
                    )
                  ],
                ),
              ) ,
            ),
          )
        ],
      )
    );
  }
}

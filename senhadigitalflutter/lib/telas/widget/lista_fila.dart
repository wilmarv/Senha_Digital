import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:senhadigitalflutter/model/usuario_fila_model.dart';

Widget ListaFila(List<DocumentSnapshot> snapshot) {
  return Container(
    padding: EdgeInsets.only(left: 1, right: 1),
    child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            crossAxisSpacing: 1,
            mainAxisSpacing: 1,
            childAspectRatio: 6),
        itemCount: snapshot.length,
        itemBuilder: (context, index) {
          Color cor = index % 2 == 0 ? Colors.grey : Colors.white60;
          if(index == snapshot.length-1)
            return Container();
          else{
            UsuarioFila fila = UsuarioFila.fromDocuments(snapshot[index+1]);
            return Container(
              decoration: BoxDecoration(color: cor, border: Border.all(width: 1)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 89,
                    child: Text(
                      "${fila.senha}",
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    width: 89,
                    child: Text(
                      fila.nome,
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    width: 89,
                    child: Text(
                      fila.matricula,
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            );
          }
        }),
  );
}

import 'package:cloud_firestore/cloud_firestore.dart';

class UsuarioFila{
  String nome;
  String matricula;
  int senha;
  bool atendido;

  UsuarioFila.fromDocuments(DocumentSnapshot snapshot){
    nome = snapshot.data["nome"];
    matricula = snapshot.data["matricula"];
    senha = snapshot.data["senha"];
    atendido = snapshot.data["atendido"];
  }

}
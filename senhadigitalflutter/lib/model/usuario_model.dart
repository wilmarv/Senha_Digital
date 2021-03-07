import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class Usuario extends Model {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser _usuario;
  Map<String, dynamic> _usuarioData = Map();

  bool isloadin = false;
  bool adm = false;

  static Usuario of(BuildContext context) => ScopedModel.of<Usuario>(context);

  void Cadastrar({
    @required Map<String, dynamic> usuarioData,
    @required String senha,
    @required VoidCallback onSuccess,
    @required VoidCallback onFail,
  }) {
    isloadin = true;
    notifyListeners();
    _auth
        .createUserWithEmailAndPassword(
            email: usuarioData["email"], password: senha)
        .then((user) async {
      this._usuario = user.user;

      onSuccess();

      await _saveUsuarioData(usuarioData);
      isloadin = false;
      notifyListeners();
    }).catchError((e) {
      onFail();
      isloadin = false;
      notifyListeners();
    });
  }

  void Login(
      {@required String email,
      @required String pass,
      @required VoidCallback onSuccess,
      @required VoidCallback onFail}) {
    isloadin = true;
    notifyListeners();
    _auth
        .signInWithEmailAndPassword(email: email, password: pass)
        .then((user) async {
      this._usuario = user.user;
      await _carregarUsuario();
      onSuccess();
      isloadin = false;
    }).catchError((e) {
      onFail();
      isloadin = false;
      notifyListeners();
    });
  }

  void Desconect()async{
    await _auth.signOut();
    _usuarioData = Map();
    _usuario = null;
    notifyListeners();
  }


  Future _carregarUsuario() async {
    if (_usuario == null) _usuario = await _auth.currentUser();
    if (_usuario != null) {
      if (_usuarioData["nome"] == null) {
        DocumentSnapshot docusuario = await Firestore.instance
            .collection("usuarios")
            .document(_usuario.email)
            .get();
        _usuarioData = docusuario.data;
        adm = _usuarioData["adm"];
      }
    }
  }
  bool conectado(){
    return _usuario!=null;
  }

  Future _saveUsuarioData(Map<String, dynamic> usuarioData) async {
    this._usuarioData = usuarioData;
    await Firestore.instance
        .collection("usuarios")
        .document(usuarioData["email"])
        .setData(usuarioData);
  }
}

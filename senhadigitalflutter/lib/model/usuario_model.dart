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
  int guiche;
  int senha;

  static Usuario of(BuildContext context) => ScopedModel.of<Usuario>(context);

  void MudarSenha(String email, VoidCallback onSuccess, VoidCallback onFail) {
    isloadin = true;
    notifyListeners();

    _auth.sendPasswordResetEmail(email: email).then((value) {
      onSuccess();
      isloadin = false;
      notifyListeners();
    }).catchError((e) {
      onFail();
      isloadin = false;
      notifyListeners();
    });
  }

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

  Future _saveUsuarioData(Map<String, dynamic> usuarioData) async {
    this._usuarioData = usuarioData;
    await Firestore.instance
        .collection("usuarios")
        .document(usuarioData["email"])
        .setData(usuarioData);
  }

  Map<String, dynamic> Dados() {
    return _usuarioData;
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
      print(e);
      onFail();
      isloadin = false;
      notifyListeners();
    });
  }

  void Desconect() async {
    await _auth.signOut();
    _usuarioData = Map();
    _usuario = null;
    adm = false;
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

  bool conectado() {
    return _usuario != null;
  }
}

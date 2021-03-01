import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Cadastro extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController email = TextEditingController();
  TextEditingController senha = TextEditingController();
  TextEditingController nome = TextEditingController();
  TextEditingController matricula = TextEditingController();
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
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Divider(height: 20),
                    TextFormField(
                      controller: nome,
                      style: TextStyle(color: Colors.white, fontSize: 17),
                      keyboardType: TextInputType.name,
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                          labelText: "Nome Completo",
                          labelStyle: TextStyle(color: Colors.white)),
                      // ignore: missing_return
                      validator: (value) {
                        if (value.isEmpty || value == null)
                          return "Insira um nome";
                      },
                    ),
                    Divider(height: 20),
                    TextFormField(
                      controller: matricula,
                      style: TextStyle(color: Colors.white, fontSize: 17),
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                          labelText: "Matricula",
                          labelStyle: TextStyle(color: Colors.white)),
                      // ignore: missing_return
                      validator: (value) {
                        if (value.isEmpty || value == null)
                          return "Insira sua matricula";
                      },
                    ),
                    Divider(height: 20),
                    TextFormField(
                      controller: email,
                      style: TextStyle(color: Colors.white, fontSize: 17),
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                          labelText: "email",
                          labelStyle: TextStyle(color: Colors.white)),
                      // ignore: missing_return
                      validator: (value) {
                        if (value.isEmpty || value == null)
                          return "Insira seu e-mail";
                      },
                    ),
                    Divider(height: 20),
                    TextFormField(
                      controller: senha,
                      style: TextStyle(color: Colors.white, fontSize: 17),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                          labelText: "Senha",
                          labelStyle: TextStyle(color: Colors.white)),
                      // ignore: missing_return
                      validator: (value) {
                        if (value.isEmpty || value == null)
                          return "Insira uma senha";
                        else if (value.length < 6)
                          return "Sua senha precisa ter mais de 6 digitos";
                      },
                    ),
                    Divider(height: 20),
                    RaisedButton(
                      onPressed: () {
                        if (formKey.currentState.validate()) {
                          cadastrarUsuario(context);
                        }
                      },
                      child: Text(
                        "Cadastrar",
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 16),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future cadastrarUsuario(BuildContext context) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email.text, password: senha.text);
      Firestore.instance.collection("usuarios").document(email.text).setData({
        "nome": nome.text,
        "matricula": matricula.text,
        "senha": senha.text
      });
      Map<String, dynamic> usuario = {"email": email.text, "senha": senha.text};
      Navigator.pop(context, usuario);
    } catch (erro) {
      return AlertDialog(
        title: Text("Algo de errado não esta Certo!"),
        content: Text("Algo deu errado para seu cadastro, tenta mais tarde"),
        actions: [
          FlatButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Text("Tentarei mais tarde!")),
        ],
      );
    }
  }
}

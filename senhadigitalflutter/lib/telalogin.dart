import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:senhadigitalflutter/appBar.dart';
import 'package:senhadigitalflutter/telacadastro.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController senha = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              padding: EdgeInsets.all(25),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Image.asset(
                          "images/slogan.png",
                          scale: 0.9,
                        )),
                    Divider(height: 40),
                    TextField(
                      controller: email,
                      style: TextStyle(color: Colors.white, fontSize: 17),
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                          labelText: "E-mail",
                          labelStyle: TextStyle(color: Colors.white)),
                    ),
                    Divider(height: 20),
                    TextField(
                      controller: senha,
                      style: TextStyle(color: Colors.white, fontSize: 17),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                          labelText: "Senha",
                          labelStyle: TextStyle(color: Colors.white)),
                    ),
                    Divider(),
                    Container(
                      width: 300,
                      height: 39,
                      padding: EdgeInsets.all(0),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                      ),
                      child: RaisedButton(
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.black),
                          ),
                          color: Colors.white60,
                          onPressed: () {}),
                    ),
                    Divider(),
                    Row(
                      children: [
                        Padding(
                            padding: EdgeInsets.all(5),
                            child: OutlineButton(
                                child: Text(
                                  "Cadastra-se",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                                disabledBorderColor: null,
                                onPressed: () async {
                                  final primeiroAcesso = await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Cadastro()));
                                  if(primeiroAcesso != null){
                                    email.text=primeiroAcesso["email"];
                                    senha.text=primeiroAcesso["senha"];

                                  }
                                })),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

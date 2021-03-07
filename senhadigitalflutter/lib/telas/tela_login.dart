import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:senhadigitalflutter/model/usuario_model.dart';
import 'package:senhadigitalflutter/telas/tela_abrirfila.dart';
import 'package:senhadigitalflutter/telas/tela_admfila.dart';
import 'package:senhadigitalflutter/telas/tela_cadastro.dart';
import 'package:senhadigitalflutter/telas/tela_gerarsenha.dart';
import 'package:senhadigitalflutter/telas/widget/appbar.dart';
import 'package:senhadigitalflutter/telas/widget/textfield.dart';

class TelaLogin extends StatefulWidget {
  @override
  _TelaLoginState createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  final _formkey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  final _scaffold = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffold,
        appBar: AppBarPadrao(),
        backgroundColor: Colors.white,
        body: ScopedModelDescendant<Usuario>(
          builder: (context, child, model) {
            return model.isloadin
                ? Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    padding: EdgeInsets.all(25),
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10)),
                        child: Form(
                          key: _formkey,
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
                              TextFieldPadrao(
                                  controller: _emailController,
                                  type: TextInputType.emailAddress,
                                  label: "E-mail",
                                  hide: false),
                              Divider(height: 20),
                              TextFieldPadrao(
                                  controller: _senhaController,
                                  type: TextInputType.visiblePassword,
                                  label: "Senha",
                                  hide: true),
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
                                    onPressed: () {
                                      if (_formkey.currentState.validate()) {
                                        model.Login(email: _emailController.text,
                                            pass: _senhaController.text,
                                            onSuccess: _onSuccess,
                                            onFail: _onFail
                                        );
                                      }
                                    }),
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
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                        onPressed: () async {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Cadastro()));
                                        }),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ));
          },
        ));
  }
  void _onSuccess() {
    Usuario.of(context).adm ? Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context)=>AbrirFila())) :
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context)=>GerarSenha())
    );
  }
  void _onFail() {
    _scaffold.currentState.showSnackBar(
        SnackBar(content: Text("Falha ao Conectar!"),
          backgroundColor: Colors.redAccent,
          duration: Duration(seconds: 2),)
    );
  }

}

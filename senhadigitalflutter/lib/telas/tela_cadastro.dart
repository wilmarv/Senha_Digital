import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:senhadigitalflutter/model/usuario_model.dart';
import 'package:senhadigitalflutter/telas/widget/textfield.dart';

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _nomeController = TextEditingController();
  final _matriculaController = TextEditingController();

  GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffold,
      appBar: AppBar(
        title: Text("Senha Digital",
            style: TextStyle(fontSize: 23, fontStyle: FontStyle.italic)),
        centerTitle: true,
        shadowColor: Colors.blue,
      ),
      body: ScopedModelDescendant<Usuario>(
        builder: (context,child,model){
          if(model.isloadin)return Center(child: CircularProgressIndicator());
          return SingleChildScrollView(
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
                        TextFieldPadrao(
                            controller: _nomeController,
                            type: TextInputType.text,
                            label: "Nome",
                            hide: false),
                        Divider(height: 20),
                        TextFieldPadrao(
                            controller: _matriculaController,
                            type: TextInputType.number,
                            label: "Matricula",
                            hide: false),
                        Divider(height: 20),
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
                        Divider(height: 20),
                        RaisedButton(
                          onPressed: () {
                            if (formKey.currentState.validate()) {
                              Map<String, dynamic> usuarioData = {
                                "nome": _nomeController.text,
                                "email": _emailController.text,
                                "matricula": _matriculaController.text,
                                "adm": false
                              };
                              Usuario.of(context).Cadastrar(
                                  usuarioData: usuarioData,
                                  senha: _senhaController.text,
                                  onSuccess: _onSuccess,
                                  onFail: _onFail);
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
          );
        },
      )
    );
  }

  void _onSuccess() {
    Map<String, dynamic> usuarioData = {
      "email": _emailController.text,
      "senha": _senhaController.text,
    };
    _scaffold.currentState.showSnackBar(SnackBar(
      content: Text("Usuario criado com sucesso!"),
      backgroundColor: Colors.blue,
      duration: Duration(seconds: 2),
    ));
    Future.delayed(Duration(seconds: 2)).then((value) => Navigator.of(context).pop(usuarioData));
  }

  void _onFail() {
    _scaffold.currentState.showSnackBar(SnackBar(
        content: Text("Falha  ao criar usuario!"),
        backgroundColor: Colors.blue,
        duration: Duration(seconds: 2)));
  }
}

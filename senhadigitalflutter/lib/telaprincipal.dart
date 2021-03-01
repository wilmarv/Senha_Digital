import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:senhadigitalflutter/telacadastro.dart';
import 'package:senhadigitalflutter/telagerador.dart';

class TelaPrincipal extends StatefulWidget {
  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  /* Variaveis da tela princial*/
  bool _login = false;
  FirebaseAuth _auth;
  FirebaseUser _usuario;
  AuthResult _authResult;
  /* Variaveis da tela princial*/

  /*Variaveis da tela de Login*/
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController _emailLogin = TextEditingController();
  TextEditingController _senhaLogin = TextEditingController();
  /*Variaveis da tela de Login*/

  Future Logar(String email,String senha) async{
    try{
      _auth = FirebaseAuth.instance;
      _authResult = await  _auth.signInWithEmailAndPassword(email: email, password: senha);
      _usuario = _authResult.user;
      setState(() {
        _login = true;
      });
    }catch(e){
      print(e);
    }
  }
  Future Desconectar()async{
    try{
      await FirebaseAuth.instance.signOut();
      _authResult= null;
      _usuario= null;
      setState(() {
        _login = false;
      });
    }catch(e){
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Senha Digital",
            style: TextStyle(fontSize: 23, fontStyle: FontStyle.italic)
        ),
        shadowColor: Colors.blue,
        actions: [
          _login ? IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                Desconectar();
              }
          ) : Container()
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(25),
        child: Center(
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10)),
            child: _login ? Gerador() : Login(),
          ),
        )
      ),
    );
  }
Widget Login(){
    return Form(
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
          TextFormField(
            controller: _emailLogin,
            style: TextStyle(color: Colors.white, fontSize: 17),
            keyboardType: TextInputType.emailAddress,
            cursorColor: Colors.white,
            decoration: InputDecoration(
                labelText: "E-mail", labelStyle: TextStyle(color: Colors.white)),
            // ignore: missing_return
            validator: (value) {
              if (value.isEmpty || value == null) return "Insira uma email!";
            },
          ),
          Divider(height: 20),
          TextFormField(
            controller: _senhaLogin,
            style: TextStyle(color: Colors.white, fontSize: 17),
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            cursorColor: Colors.white,
            decoration: InputDecoration(
                labelText: "Senha", labelStyle: TextStyle(color: Colors.white)),
            // ignore: missing_return
            validator: (value) {
              if (value.isEmpty || value == null) return "Insira uma senha!";
            },
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
                onPressed: () {
                  if (_formkey.currentState.validate()){
                    Logar(_emailLogin.text, _senhaLogin.text);
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
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    onPressed: () async{
                      Map _usuarioNovo = await
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context)=>Cadastro()));
                      if(_usuarioNovo != null){
                        _emailLogin.text = _usuarioNovo["email"];
                        _senhaLogin.text = _usuarioNovo ["senha"];
                        Logar(_usuarioNovo["email"], _usuarioNovo["senha"]);
                        _usuario.sendEmailVerification();
                      }
                    }),
              ),
            ],
          )
        ],
      ),
    );
}

}

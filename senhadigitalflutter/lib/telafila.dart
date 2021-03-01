import 'package:flutter/material.dart';

class Fila extends StatefulWidget {
  @override
  _FilaState createState() => _FilaState();
}

class _FilaState extends State<Fila> {
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
              child: Column(
                  children: [
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xffffffff),
                        border: Border.all(
                          width: 5,
                          color: Colors.blue,
                        ),
                      ),
                      child: Column(
                        children: <Widget>[
                          Divider(color: Colors.transparent),
                          Text("002",style: TextStyle(fontSize: 50),),
                          Text("Senha Atual",style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic),),
                          Text("01",style: TextStyle(fontSize: 50),),
                          Text("Guiche",style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic),),
                        ],
                      ),
                    ),
                    Divider(color: Colors.transparent),
                    Container(
                      width: 250,
                      decoration: BoxDecoration(
                        color: const Color(0xffffffff),
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          width: 5,
                          color: Colors.blue,
                        ),
                      ),
                      child: Column(
                        children: <Widget>[
                          Text("003",style: TextStyle(fontSize: 50),),
                          Text("Sua senha",style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic),),
                        ],
                      ),
                    ),
                    Divider(color: Colors.transparent),
                    Divider(color: Colors.transparent),
                    Row(

                      children: <Widget>[
                        Container(
                          color: Colors.white,
                          width: 140,
                          height: 85,
                          child: Column(
                            children: <Widget>[
                              Text("001",style: TextStyle(fontSize: 50),),
                              Text("Senha anterior",style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic),),
                            ],
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(left: 10),
                        child: Container(
                          color: Colors.white,
                          width: 140,
                          height: 85,
                          child: Column(
                            children: <Widget>[
                              Text("01",style: TextStyle(fontSize: 50),),
                              Text("Guiche",style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic),),
                            ],
                          ),
                        ),)
                      ],
                    )
                  ]
              ),
            ),
          ),
        ),
      ),
    );;
  }
}

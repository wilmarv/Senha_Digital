import 'package:flutter/material.dart';

Widget TextFieldPadrao(
    {@required TextEditingController controller,
    @required TextInputType type,
    @required String label,
    @required bool hide}){
  return TextFormField(
    controller: controller,
    style: TextStyle(color: Colors.white, fontSize: 17),
    obscureText: hide,
    keyboardType: type,
    cursorColor: Colors.white,
    decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.white)),
    // ignore: missing_return
    validator: (value) {
      if (value.isEmpty || value == null) return "${label} Invalido!";
    },
  );
}
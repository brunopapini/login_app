import 'package:flutter/material.dart';
import 'package:login_app/home_page.dart';
import 'login_api.dart';
import 'alert.dart';

class LoginPage extends StatelessWidget { //Widget statico

  //Controladores de Texto del login y password
  final _ctrlLogin = TextEditingController();
  final _ctrlPass = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Acceso",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: <Widget>[
          _textFormField(
            "Login",
            "Enter Login",
            controller: _ctrlLogin,
            validator: _validaLogin,
          ),
          _textFormField("Pass", "Enter your Pass",
              senha: true, controller: _ctrlPass, validator: _validaPass),
          _raisedButton("Login", Colors.orange, context),
        ],
      ),
    );
  }

  _textFormField(
    String label,
    String hint, {
    bool senha = false,
    TextEditingController controller,
    FormFieldValidator<String> validator,
  }) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: senha,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
      ),
    );
  }

  String _validaLogin(String texto) {
    if (texto.isEmpty) {
      return "Enter Login";
    }
    return null;
  }

  String _validaPass(String texto) {
    if (texto.isEmpty) {
      return "Enter Pass";
    }
    return null;
  }

  _raisedButton(String texto, Color cor, BuildContext context) {
    return RaisedButton(
      color: cor,
      child: Text(
        texto,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
      onPressed: () {
        _clickButton(context);
      },
    );
  }

  void _clickButton(BuildContext context) async {
    bool formOk = _formKey.currentState.validate();

    if (!formOk) {
      return;
    }

    String login = _ctrlLogin.text;
    String pass = _ctrlPass.text;

    print("login: $login pass: $pass ");

    var usuario = await LoginAPI.login(login, pass);

    if (usuario != null) {
      print("==> $usuario ");

      _navegaHomePage(context);
    } else {
      alert(context, "Login Invalido");
    }
  }

  _navegaHomePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => new HomePage()),
    );
  }
} //Login Page

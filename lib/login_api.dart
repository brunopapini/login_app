import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'usuario.dart';

var usuario;

class LoginAPI {
  static Future<Usuario> login(String user, String password) async {

    var url = 'http://192.168.0.113:8000/rest-auth/login/';

    var header = {"Content-Type": "application/json"};

    Map params = {"username": user, "email": user, "password": password};

    //Guardar token
    var prefs = await SharedPreferences.getInstance();


    var _body = json.encode(params);





    print("json enviado : $_body");

    var response = await http.post(
      url,
      headers: header,
      body: _body,
    );

    print('Response status: ${response.statusCode}');

    Map mapResponse = json.decode(response.body);

    if (response.statusCode == 200) {

      usuario = Usuario.fromJson(mapResponse);

      prefs.setString("tokenjwt", mapResponse["key"]);

    } else {
      usuario = null;
    }
    return usuario;


  }
}

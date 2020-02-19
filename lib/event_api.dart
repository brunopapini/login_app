import 'package:login_app/event.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class EventApi {

  static Future<List<Event>> getEvents() async {
    // este metodo asincrono recibe la data de la url y la decodifica

    //Recuperar token para autenticar endpoint seguro
    var prefs = await SharedPreferences.getInstance();
    String token = (prefs.getString("tokenjwt") ?? "");

    // para ver por consola que estoy enviando
    print("token jwt: $token");

    //Headers y url del metodo GET
    var header = {
      "Content-Type": "application/json",
      "Authorization": "Token $token"
    };
    var url = "http://192.168.0.113:8000/event1";

    //Get endpoint API
    var data = await http.get(
        url, headers: header);
    //Decode  endpoint
    var jsonData = json.decode(data.body);
    //Generate List of decoded events

    List<Event> events = []; // genera una lista con esa data
    for (var u in jsonData) {
      Event event = Event(
          u["id"],
          u["fechaCreacion"],
          u["descripcion"],
          u["lugar"],
          u["tipo"],
          u["usarioAAdido"],
          u["usuarioCreador"]);

      events.add(event); // aca añade la data a la lista
    }
    print(events.length);
    return events; // aca retorna la lista
  }


}



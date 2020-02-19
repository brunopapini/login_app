import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'event_api.dart';


// clase Stateful Widget que contempla cambios
class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String events;


@override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Events"),
      ),
      body: Container(
        child: FutureBuilder( // widget para renderiza el future, que tiene dos parametros, future y builder
          future: EventApi.getEvents(),// lo que va a recibir al ser asincronico
          builder: (BuildContext context, AsyncSnapshot snapshot) {

            if (snapshot.data == null ) {
              return Container(child: Center(child: Text("Esperando...")));
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, index) {
                  return ListTile(
                    title: Text(snapshot.data[index].lugar),
                    subtitle: Text(snapshot.data[index].descripcion),
                    onTap: () {
                    },
                  );
                },
              );
            }
          },
        ),
      ),
    );
}
}






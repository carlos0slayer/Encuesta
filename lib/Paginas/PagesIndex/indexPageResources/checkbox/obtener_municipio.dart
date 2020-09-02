import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';

class obtener_municipio extends StatefulWidget {
  @override
  _obtener_municipioState createState() => _obtener_municipioState();
}

class _obtener_municipioState extends State<obtener_municipio> {
  Future<List<Municipios>> _getMunicipios() async {
    var data = await ('assets/municipios.json');
    var jsonData = json.decode(data);
    List<Municipios> municipio = [];
    for (var u in jsonData) {
      Municipios municipios = Municipios(u["nombre"]);
      municipio.add(municipios);
    }
    print(municipio.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Json'),
      ),
      body: Container(
        child: FutureBuilder(
          future: _getMunicipios(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(snapshot.data[index].nombre),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class Municipios {
  final String nombre;

  Municipios(this.nombre);
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: completed2(),
    );
  }
}

class completed2 extends StatefulWidget {
  @override
  _completed2State createState() => _completed2State();
}

class _completed2State extends State<completed2> {
  @override
  void initState() {
    _getStateList();
    _getMunicipio();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dynamic DropDownList REST API'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(bottom: 100, top: 100),
            child: Text(
              'KDTechs',
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
            ),
          ),
          //======================================================== State

          Container(
            padding: EdgeInsets.only(left: 15, right: 15, top: 5),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: DropdownButtonHideUnderline(
                    child: ButtonTheme(
                      alignedDropdown: true,
                      child: DropdownButton<String>(
                        value: _miMunicipio,
                        iconSize: 30,
                        icon: (null),
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                        ),
                        hint: Text('Selecciona Municipio'),
                        onChanged: (String newValue) {
                          setState(() {
                            _miMunicipio = newValue;
                            loadPerson();
                            print(_miMunicipio);
                          });
                        },
                        items: municipiosList?.map((item) {
                              return new DropdownMenuItem(
                                child: new Text(item['municipio']),
                                value: item['id'].toString(),
                              );
                            })?.toList() ??
                            [],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),

          //======================================================== City

          Container(
            padding: EdgeInsets.only(left: 15, right: 15, top: 5),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: DropdownButtonHideUnderline(
                    child: ButtonTheme(
                      alignedDropdown: true,
                      child: DropdownButton<String>(
                        value: _miLocalidad,
                        iconSize: 30,
                        icon: (null),
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                        ),
                        hint: Text('Select Localidad'),
                        onChanged: (String newValue) {
                          setState(() {
                            _miLocalidad = newValue;
                            print(_miLocalidad);
                          });
                        },
                        items: localidadesList?.map((item) {
                              return new DropdownMenuItem(
                                child: new Text(item['localidad']),
                                value: item['id'].toString(),
                              );
                            })?.toList() ??
                            [],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //=============================================================================== Api Calling here

//CALLING STATE API HERE
// Get State information by API
  List statesList;
  String _myState;

  String stateInfoUrl = 'http://cleanions.bestweb.my/api/location/get_state';
  Future<String> _getStateList() async {
    await http.post(stateInfoUrl, headers: {
      'Content-Type': 'application/x-www-form-urlencoded'
    }, body: {
      "api_key": '25d55ad283aa400af464c76d713c07ad',
    }).then((response) {
      var data = json.decode(response.body);

//      print(data);
      setState(() {
        statesList = data['state'];
        //print(statesList);
      });
    });
  }

  List municipiosList;
  String _miMunicipio;

  List localidadesList;
  List localidadesListDep;
  String _miLocalidad;
  Future<String> _getMunicipio() async {
    await rootBundle
        .loadString('assets/images/municipios.json')
        .then((respuesta) {
      var data = json.decode(respuesta);
      setState(() {
        municipiosList = data['municipios'];
        //print(municipiosList);
      });
    });
  }

  Future<String> _getLocalidadesList() async {
    await rootBundle.loadString('assets/images/localidades.json').then((value) {
      var data = jsonDecode(value);

      setState(() {
        localidadesList = data['localidades'];
        //print(localidadesList);
      });
      //print(temp["localidades"][0]["id_municipio"]);
    });
  }

  // Get State information by API
  List citiesList;
  String _myCity;

  String cityInfoUrl =
      'http://cleanions.bestweb.my/api/location/get_city_by_state_id';
  Future<String> _getCitiesList() async {
    await http.post(cityInfoUrl, headers: {
      'Content-Type': 'application/x-www-form-urlencoded'
    }, body: {
      "api_key": '25d55ad283aa400af464c76d713c07ad',
      "state_id": _myState,
    }).then((response) {
      var data = json.decode(response.body);
      setState(() {
        citiesList = data['cities'];
        //print(citiesList);
      });
    });
  }

  Future<String> loadPersonFromAssets() async {
    return await rootBundle.loadString('assets/images/localidades.json');
  }

  Future loadPerson() async {
    String jsonString = await loadPersonFromAssets();
    final jsonResponse = json.decode(jsonString);
    Localidades person = new Localidades.fromJson(jsonResponse);
    print('id: ${person.id}');
    print('localidad: ${person.localidad}');
    print('id_municipio: ${person.idmunicipio}');
  }
}

class Localidades {
  final String id;
  final String localidad;
  final String idmunicipio;

  Localidades({this.id, this.localidad, this.idmunicipio});

  factory Localidades.fromJson(Map<String, dynamic> json) {
    return Localidades(
        id: json['localidades'][0]['id'],
        localidad: json['localidades'][0]['localidad'],
        idmunicipio: json['localidades'][0]['id_municipio']);
  }
}

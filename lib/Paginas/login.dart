import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:siegeestappv1/Paginas/Animation/FadeAnimation.dart';
import 'package:siegeestappv1/Paginas/PagesIndex/home_page.dart';
import 'package:http/http.dart' as http;
import 'package:siegeestappv1/main.dart';

class LoginPage extends StatefulWidget {
  LoginPage({this.mimac});
  String mimac;
  @override
  _LoginPageState createState() => _LoginPageState();
}

String nombre = '';

class _LoginPageState extends State<LoginPage> {
  TextEditingController codigoAcceso = new TextEditingController();
  String msg = '';

  Future<List> _login() async {
    final response = await http.post(
        "https://siegeest.app/enlaceSSP/php/loginapp.php",
        body: {"macAddress": widget.mimac, "codigoAcceso": codigoAcceso.text});

    var datauser = jsonDecode(response.body);
    if (datauser.length == 0) {
      setState(() {
        msg = 'Usuario o Contraseña Incorrectos';
      });
    } else {
      if (datauser[0]['level'] == 'admin') {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => HomePage(
            nombre: nombre,
          ),
        ));
      } else if (datauser[0]['level'] == 'invitado') {}
      setState(() {
        nombre = datauser[0]['nombre'];
      });
    }

    return datauser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(240, 244, 247, 3),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 400,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/siegeestbg.png'),
                          fit: BoxFit.fill)),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 30,
                        top: 40,
                        width: 300,
                        height: 200,
                        child: FadeAnimation(
                            1.5,
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/mexico.png'))),
                            )),
                      ),
                      Positioned(
                        child: FadeAnimation(
                            1.6,
                            Container(
                              margin: EdgeInsets.only(top: 100),
                              child: Center(
                                child: Text(
                                  "Bienvenido",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                      FadeAnimation(
                          1.8,
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(109, 182, 184, .5),
                                      blurRadius: 8.0,
                                      offset: Offset(0, 5))
                                ]),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(border: Border()),
                                  child: TextField(
                                    controller: codigoAcceso,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Codigo de Acceso",
                                        suffixIcon: Icon(Icons.account_circle,
                                            color: Color.fromRGBO(
                                                28, 126, 127, 1)),
                                        hintStyle:
                                            TextStyle(color: Colors.grey[400])),
                                  ),
                                ),
                              ],
                            ),
                          )),
                      SizedBox(
                        height: 30,
                      ),
                      FadeAnimation(
                          2,
                          Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width * 0.90,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(colors: [
                                  Color.fromRGBO(28, 126, 127, 1),
                                  Color.fromRGBO(28, 126, 127, .8),
                                ])),
                            child: FlatButton(
                              child: Text(
                                "Continuar",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {
                                _login();
                                /*Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => HomePage(),
                                ));*/
                              },
                            ),
                          )),
                      Text(msg, style: TextStyle(color: Colors.red)),
                      SizedBox(
                        height: 70,
                      ),
                      FadeAnimation(
                          1.5,
                          Text(
                            "Mac: ${widget.mimac}",
                            style: TextStyle(
                                color: Color.fromRGBO(28, 126, 127, 1)),
                          )),
                      FadeAnimation(
                        2,
                        Container(
                          height: MediaQuery.of(context).size.height / 11,
                          width: MediaQuery.of(context).size.width * 0.90,
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                bottom: 0,
                                width: 60,
                                height: 50,
                                child: FadeAnimation(
                                    1,
                                    Container(
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/poweredbymastec.png'))),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

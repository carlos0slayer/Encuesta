import 'package:flutter/material.dart';

class PerfilPage extends StatefulWidget {
  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF212121),
      body: Container(
        child: Text(
          "Perfil",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 100.0),
        ),
      ),
    );
  }
}

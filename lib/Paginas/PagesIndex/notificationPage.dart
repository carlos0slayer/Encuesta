import 'package:flutter/material.dart';

class NotificacionesPage extends StatefulWidget {
  @override
  _NotificacionesPageState createState() => _NotificacionesPageState();
}

class _NotificacionesPageState extends State<NotificacionesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(240, 244, 247, 3),
      body: Container(
        child: Text(
          "Notificaciones",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 100.0),
        ),
      ),
    );
  }
}

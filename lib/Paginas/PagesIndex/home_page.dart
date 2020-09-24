import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:siegeestappv1/Paginas/PagesIndex/HomePageResources/animated_bootom_bar.dart';
import 'package:siegeestappv1/Paginas/PagesIndex/chatPage.dart';
import 'package:siegeestappv1/Paginas/PagesIndex/indexPage.dart';
import 'package:siegeestappv1/Paginas/PagesIndex/notificationPage.dart';
import 'package:siegeestappv1/Paginas/PagesIndex/profilePage.dart';
import 'package:siegeestappv1/Paginas/login.dart';

class HomePage extends StatefulWidget {
  HomePage(
      {this.nombre,
      this.ciudad,
      this.username,
      this.apellidoPaterno,
      this.apellidoMaterno,
      this.fechaNacimiento,
      this.direccion,
      this.telefono,
      this.imagen});
  String nombre;
  String ciudad;
  String username;
  String apellidoPaterno;
  String apellidoMaterno;
  String fechaNacimiento;
  String direccion;
  String telefono;
  String imagen;
  final List<BarItem> barItems = [
    BarItem(
      text: "Inicio",
      iconos: FontAwesomeIcons.home,
      color: Color.fromRGBO(24, 122, 123, 3),
    ),
    BarItem(
        text: "Notificaciones",
        iconos: FontAwesomeIcons.bell,
        color: Color.fromRGBO(178, 0, 98, 1)),
    BarItem(
        text: "Mi Perfil",
        iconos: FontAwesomeIcons.user,
        color: Color.fromRGBO(104, 32, 69, 1)),
  ];

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedBarIndex = 0;

  //Paginas
  final IndexPage _paginaHome = IndexPage(nombre: nombre);
  final NotificacionesPage _paginaNotificaciones = NotificacionesPage();
  final PerfilPage _paginaPerfil = PerfilPage(
      ciudad: ciudad,
      username: username,
      nombre: nombre,
      apellidoPaterno: apellidoPaterno,
      apellidoMaterno: apellidoMaterno,
      fechaNacimiento: fechaNacimiento,
      direccion: direccion,
      telefono: telefono,
      imagen: imagen);

  Widget _showPage = new IndexPage();

  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return _paginaHome;
        break;
      case 1:
        return _paginaNotificaciones;
        break;
      case 2:
        return _paginaPerfil;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        child: _showPage,
        duration: const Duration(milliseconds: 700),
      ),
      bottomNavigationBar: AnimatedBottomBar(
        barItems: widget.barItems,
        animationDuration: const Duration(milliseconds: 550),
        onBarTap: (index) {
          setState(() {
            _showPage = _pageChooser(index);
          });
        },
      ),
    );
  }
}

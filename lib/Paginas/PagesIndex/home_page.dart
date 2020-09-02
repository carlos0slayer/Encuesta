import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:siegeestappv1/Paginas/PagesIndex/HomePageResources/animated_bootom_bar.dart';
import 'package:siegeestappv1/Paginas/PagesIndex/chatPage.dart';
import 'package:siegeestappv1/Paginas/PagesIndex/indexPage.dart';
import 'package:siegeestappv1/Paginas/PagesIndex/notificationPage.dart';
import 'package:siegeestappv1/Paginas/PagesIndex/profilePage.dart';

class HomePage extends StatefulWidget {
  final List<BarItem> barItems = [
    BarItem(
      text: "Inicio",
      iconos: FontAwesomeIcons.home,
      color: Color.fromRGBO(98, 163, 164, 1),
    ),
    BarItem(
        text: "Mensajes",
        iconos: FontAwesomeIcons.mailBulk,
        color: Color.fromRGBO(255, 197, 38, 1)),
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
  final IndexPage _paginaHome = IndexPage();
  final ChatPage _paginaChat = ChatPage();
  final NotificacionesPage _paginaNotificaciones = NotificacionesPage();
  final PerfilPage _paginaPerfil = PerfilPage();

  Widget _showPage = new IndexPage();

  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return _paginaHome;
        break;
      case 1:
        return _paginaChat;
        break;
      case 2:
        return _paginaNotificaciones;
        break;
      case 3:
        return _paginaPerfil;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        child: _showPage,
        duration: const Duration(milliseconds: 500),
      ),
      bottomNavigationBar: AnimatedBottomBar(
        barItems: widget.barItems,
        animationDuration: const Duration(milliseconds: 200),
        onBarTap: (index) {
          setState(() {
            _showPage = _pageChooser(index);
          });
        },
      ),
    );
  }
}

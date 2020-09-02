import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:siegeestappv1/Paginas/PagesIndex/chatPageResources/data.dart';
import 'package:siegeestappv1/Paginas/PagesIndex/chatPageResources/message_model.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<MessageModel> messages = new List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    messages = getMessage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(240, 244, 247, 3),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 70,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: Image.asset(
                  "assets/images/ingluciano.png",
                  height: 90,
                  width: 90,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 14,
              ),
              Text(
                "Luciano Castañeda",
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 4,
              ),
              Text("Hace 5 minutos"),
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: SingleChildScrollView(
                    child: ListView.builder(
                        itemCount: messages.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return SingleChildScrollView(
                            child: ChattingTile(
                              isByMe: messages[index].isByMe,
                              message: messages[index].message,
                            ),
                          );
                        }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(240, 244, 247, 3),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 30),
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
              child: Row(
                children: <Widget>[
                  SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Icon(
                        FontAwesomeIcons.smile,
                        size: 30,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration.collapsed(hintText: "Aa"),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Icon(
                        FontAwesomeIcons.paperPlane,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ChattingTile extends StatelessWidget {
  final bool isByMe;
  final String message;
  ChattingTile({@required this.isByMe, @required this.message});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          margin: EdgeInsets.only(bottom: 24),
          alignment: isByMe ? Alignment.centerRight : Alignment.centerLeft,
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                  color:
                      isByMe ? Color.fromRGBO(255, 197, 38, 1) : Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                      bottomLeft:
                          isByMe ? Radius.circular(30) : Radius.circular(0),
                      bottomRight:
                          isByMe ? Radius.circular(0) : Radius.circular(30))),
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              child: SingleChildScrollView(
                child: Container(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 2 / 3),
                  child: Text(
                    message,
                    style: TextStyle(
                        color: isByMe
                            ? Colors.white
                            : Color.fromRGBO(255, 197, 38, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}

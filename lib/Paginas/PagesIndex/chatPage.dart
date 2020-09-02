import 'package:flutter/material.dart';
import 'package:siegeestappv1/Paginas/Animation/FadeAnimation.dart';
import 'package:siegeestappv1/Paginas/PagesIndex/chatPageResources/chat.dart';
import 'package:siegeestappv1/Paginas/PagesIndex/chatPageResources/chat_model.dart';
import 'package:siegeestappv1/Paginas/PagesIndex/chatPageResources/data.dart';
import 'package:siegeestappv1/Paginas/PagesIndex/chatPageResources/story_model.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<StoryModel> stories = new List();
  List<ChatModel> chats = new List();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    stories = getStories();
    chats = getChats();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff171719),
      body: SingleChildScrollView(
        child: AnimatedContainer(
          color: Color(0xff171719),
          duration: const Duration(milliseconds: 500),
          child: FadeAnimation(
              .7,
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 70,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Mensajes",
                          style: TextStyle(
                              color: Color.fromRGBO(255, 197, 38, 1),
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Color(0xff444446),
                              borderRadius: BorderRadius.circular(12)),
                          child: Icon(
                            Icons.add,
                            color: Color.fromRGBO(255, 197, 38, 1),
                          ),
                        )
                      ],
                    ),
                  ),
                  //Now Stories
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    height: 120,
                    child: ListView.builder(
                        itemCount: stories.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return StoryTile(
                            imgUrl: stories[index].imgUrl,
                            username: stories[index].userName,
                          );
                        }),
                  ),
                  //=============Chats=================//
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 30),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  "Recientes",
                                  style: TextStyle(
                                      color: Colors.black45,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Spacer(),
                                Icon(
                                  Icons.more_vert,
                                  color: Colors.black45,
                                ),
                              ],
                            ),
                          ),
                          ListView.builder(
                              itemCount: chats.length,
                              shrinkWrap: true,
                              physics: ClampingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return ChatTile(
                                  imgUrl: chats[index].imgUrl,
                                  name: chats[index].name,
                                  lastMessage: chats[index].lastMessage,
                                  haveunreadmessages:
                                      chats[index].haveunreadmessages,
                                  unreadmessages: chats[index].unreadmessages,
                                  lastSeenTime: chats[index].lastSeenTime,
                                );
                              }),
                        ],
                      )),
                ],
              )),
        ),
      ),
    );
  }
}

class StoryTile extends StatelessWidget {
  String imgUrl;
  String username;
  StoryTile({@required this.imgUrl, @required this.username});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: Image.asset(
              imgUrl,
              height: 70,
              width: 70,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            username,
            style: TextStyle(
                color: Color(0xff78778a),
                fontSize: 16,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}

class ChatTile extends StatelessWidget {
  String imgUrl;
  String name;
  String lastMessage;
  bool haveunreadmessages;
  int unreadmessages;
  String lastSeenTime;
  ChatTile(
      {@required this.unreadmessages,
      @required this.haveunreadmessages,
      @required this.lastSeenTime,
      @required this.lastMessage,
      @required this.imgUrl,
      @required this.name});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ChatScreen()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 16),
        child: Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child: Image.asset(
                imgUrl,
                height: 60,
                width: 60,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    name,
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    lastMessage,
                    style: TextStyle(color: Colors.black54, fontSize: 15),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 14,
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(lastSeenTime),
                  SizedBox(
                    height: 16,
                  ),
                  haveunreadmessages
                      ? Container(
                          width: 30,
                          height: 30,
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(255, 197, 38, 1),
                              borderRadius: BorderRadius.circular(12)),
                          child: Text(
                            "$unreadmessages",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ))
                      : Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

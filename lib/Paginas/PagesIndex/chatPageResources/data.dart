import 'package:siegeestappv1/Paginas/PagesIndex/chatPageResources/story_model.dart';

import 'chat_model.dart';
import 'message_model.dart';

List<StoryModel> getStories() {
  List<StoryModel> stories = new List();
  StoryModel storyModel = new StoryModel();

  storyModel.imgUrl = "assets/images/chico1.png";
  storyModel.userName = "Alberto";
  stories.add(storyModel);
  storyModel = new StoryModel();

  storyModel.imgUrl = "assets/images/chica1.png";
  storyModel.userName = "Ana";
  stories.add(storyModel);
  storyModel = new StoryModel();

  storyModel.imgUrl = "assets/images/chico2.png";
  storyModel.userName = "Luis";
  stories.add(storyModel);
  storyModel = new StoryModel();

  storyModel.imgUrl = "assets/images/chica3.png";
  storyModel.userName = "Yaneth";
  stories.add(storyModel);
  storyModel = new StoryModel();

  storyModel.imgUrl = "assets/images/chico3.png";
  storyModel.userName = "Lic. Armando";
  stories.add(storyModel);
  storyModel = new StoryModel();

  return stories;
}

List<ChatModel> getChats() {
  List<ChatModel> chats = new List();
  ChatModel chatModel = new ChatModel();

//1
  chatModel.name = "Alberto";
  chatModel.imgUrl = "assets/images/chico1.png";
  chatModel.lastMessage =
      "Hola, te envio la ultima informacion de los datos que me pediste";
  chatModel.lastSeenTime = "5m";
  chatModel.haveunreadmessages = true;
  chatModel.unreadmessages = 1;
  chats.add(chatModel);
  chatModel = new ChatModel();

//2
  chatModel.name = "Laura";
  chatModel.imgUrl = "assets/images/chica2.png";
  chatModel.lastMessage =
      "Buen dia, puedes enviarme la informacion de todos los Beneficiarios registrados de hoy porfavor?";
  chatModel.lastSeenTime = "5m";
  chatModel.haveunreadmessages = true;
  chatModel.unreadmessages = 3;
  chats.add(chatModel);
  chatModel = new ChatModel();

//3
  chatModel.name = "Luis";
  chatModel.imgUrl = "assets/images/chico2.png";
  chatModel.lastMessage =
      "Me puedes pasar enviar el documento de los Codigos Postales porfavor?";
  chatModel.lastSeenTime = "5m";
  chatModel.haveunreadmessages = true;
  chatModel.unreadmessages = 1;
  chats.add(chatModel);
  chatModel = new ChatModel();

//4
  chatModel.name = "Soporte SiegeEst";
  chatModel.imgUrl = "assets/images/poweredbymastec.png";
  chatModel.lastMessage =
      "Hola, estamos aqui para brindar soporte a la App, en que le puedo ayudar";
  chatModel.lastSeenTime = "5m";
  chatModel.haveunreadmessages = true;
  chatModel.unreadmessages = 4;
  chats.add(chatModel);
  chatModel = new ChatModel();

  chatModel.name = "Karolina";
  chatModel.imgUrl = "assets/images/chica5.png";
  chatModel.lastMessage =
      "Ya estoy dando de alta a mas Beneficiarios en un momento te paso los datos, gracias";
  chatModel.lastSeenTime = "5m";
  chatModel.haveunreadmessages = true;
  chatModel.unreadmessages = 6;
  chats.add(chatModel);
  chatModel = new ChatModel();

  return chats;
}

List<MessageModel> getMessage() {
  List<MessageModel> messages = new List();
  MessageModel messageModel = new MessageModel();

  //1
  messageModel.isByMe = false;
  messageModel.message = "Hola Carlos, como te va con la App?";
  messages.add(messageModel);
  messageModel = new MessageModel();
  //1
  messageModel.isByMe = true;
  messageModel.message = "Que tal Inge";
  messages.add(messageModel);
  messageModel = new MessageModel();
  //1
  messageModel.isByMe = true;
  messageModel.message =
      "Funciona muy bien no me ha dado problemas hasta el momento";
  messages.add(messageModel);
  messageModel = new MessageModel();
  //1
  messageModel.isByMe = false;
  messageModel.message =
      "Que bueno, informanos si te llegara a fallar. Gracias";
  messages.add(messageModel);
  messageModel = new MessageModel();

  return messages;
}

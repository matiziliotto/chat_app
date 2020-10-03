import 'package:flutter/material.dart';

// Import of pages
import 'package:chat_app/src/pages/Main.dart';
import 'package:chat_app/src/pages/chat/Chat.dart';
import 'package:chat_app/src/pages/login/Login.dart';

//TODO: este se saca porque ahora se esta harcordeando todo
import 'package:chat_app/src/models/Message_model.dart';

Map<String, WidgetBuilder> getAppRoutes(){
  // TODO: ESTO SE FLETA, SE TIENE QUE CONSULTAR AL BACKEND
  List<MessageModel> messageList = [
    MessageModel('Hola matias'),
    MessageModel('Como estas'),
    MessageModel('Bien, vos?'),
  ];
  return <String, WidgetBuilder>{
    "/Main" : (BuildContext context) =>Main(),
    "/Chat" : (BuildContext context) =>Chat(messageList, 'Matias'),
    "/Login" : (BuildContext context) =>Login(),
  };
}

import 'package:flutter/material.dart';

// Import of pages
import 'package:chat_app/src/pages/principal.dart';
import 'package:chat_app/src/pages/chat/chat.dart';


Map<String, WidgetBuilder> getAppRoutes(){
  return <String, WidgetBuilder>{
    "/principal" : (BuildContext context) =>Principal(),
    "/chat" : (BuildContext context) =>Chat({'mensaje1': 'Mati1', 'mensaje2': 'Mati2', 'mensaje3': 'Mati3'}, 'Matias'),
  };
}

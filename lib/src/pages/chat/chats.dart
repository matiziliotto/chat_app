import 'package:chat_app/src/pages/chat/widget/chat_item.dart';
import 'package:flutter/material.dart';

class Chats extends StatefulWidget {

  @override
  _ChatsState createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(22, 54, 90, 1),
        title: Text('Chats'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(4.0, 1, 4.0, 1),
        children: [
          Column(
            children: [
              ChatItem('Jorge'),
              ChatItem('Julian'),
              ChatItem('Joaquin'),
              ChatItem('Matias'),
              ChatItem('Rocio'),
              ChatItem('Delfi'),
              ChatItem('Nico'),
              ChatItem('Juan'),
            ],
          ),
        ],
      )
    );
  }
}
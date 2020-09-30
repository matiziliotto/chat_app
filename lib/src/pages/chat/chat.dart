import 'dart:async';

import 'package:chat_app/src/models/Message_model.dart';
import 'package:flutter/material.dart';

// Widgets
import 'package:chat_app/src/pages/chat/widgets/Message_received.dart';
import 'package:chat_app/src/pages/chat/widgets/Message_send.dart';

class Chat extends StatefulWidget {

  final List<MessageModel> mensajes;
  final String name;
  const Chat(this.mensajes,this.name);

  @override
  _ChatState createState() => _ChatState(mensajes: this.mensajes, name:this.name);
}

class _ChatState extends State<Chat> {
  String name;
  List<MessageModel> mensajes;

  _ChatState({this.mensajes, this.name});
    ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    List<Widget> messages = new List();

    for (var i = 0; i < this.mensajes.length; i++) {
      messages.add(MessageSend(this.mensajes[i].comment, '09:00'));
      messages.add(MessageReceived(this.mensajes[i].comment, '09:00'));
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(22, 54, 90, 1),
        leading: new IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => {
              Navigator.of(context).pushReplacementNamed("/Main"),
            }
          ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              // backgroundImage: NetworkImage(_model.avatarUrl), // TODO: image of user
              backgroundImage: NetworkImage('https://simulacionymedicina.es/wp-content/uploads/2015/11/default-avatar-300x300-1.jpg'),
            ),
            SizedBox(width: 15),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  this.name,
                  style: TextStyle(
                    color: Colors.white
                  ),
                  // style: Theme.of(context).textTheme.subhead,
                  // overflow: TextOverflow.clip,
                ),
                Text(
                  "Online", // TODO: consultar estado mediante sockets
                  style: Theme.of(context).textTheme.subtitle.apply(
                        color: Colors.green,
                      ),
                )
              ],
            )
          ],
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Flexible(
                child: ListView(
                  controller: _controller,
                  padding: EdgeInsets.fromLTRB(5.0, 1.0, 5.0, 1.0),
                  children: messages
                ),
              ),
              buildMessageTextField(),
            ],
          )
        ],
      ),
    );
  }

  Widget buildMessageTextField() {
    TextEditingController textEditingController = new TextEditingController();

    void addNewMessage() {
      if (textEditingController.text.trim().isNotEmpty) {
        MessageModel newMessage = MessageModel(textEditingController.text.trim());

        setState(() {
          this.mensajes.add(newMessage);
          textEditingController.text = '';
        });
      }

      Timer(Duration(milliseconds: 500), () => _controller.jumpTo(_controller.position.maxScrollExtent));
    }

    return Container(    
      child: Container(
        padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
        height: 50.0,      
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: TextField(            
                  controller: textEditingController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Escribe tu mensaje',
                    hintStyle: TextStyle(
                      fontSize: 16.0,
                      color: Color(0xffAEA4A3),
                    ),
                  ),
                  textInputAction: TextInputAction.send,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                  onSubmitted: (_) {
                    addNewMessage();
                  },
                  onTap: () => {
                    Timer(Duration(milliseconds: 300), () => _controller.jumpTo(_controller.position.maxScrollExtent))
                  },
                ),
              ),
            ),
            Container(
              width: 50.0,
              child: InkWell(
                onTap: addNewMessage,
                child: Icon(
                  Icons.send,
                  color: Colors.blueAccent,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
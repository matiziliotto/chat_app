import 'dart:async';

import 'package:chat_app/src/models/Message_model.dart';
import 'package:flutter/material.dart';

// Widgets
import 'package:chat_app/src/pages/chat/widgets/Message_received.dart';
import 'package:chat_app/src/pages/chat/widgets/Message_send.dart';
import 'package:flutter/services.dart';

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
        backgroundColor: Theme.of(context).backgroundColor,
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
                    color: Theme.of(context).accentColor,
                  ),
                  // style: Theme.of(context).textTheme.subhead,
                  // overflow: TextOverflow.clip,
                ),
                Text(
                  "Online", // TODO: consultar estado mediante sockets
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.green[300],
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
                child: GestureDetector(
                  onTap: () => SystemChannels.textInput.invokeMethod('TextInput.hide'),
                    child: ListView(
                    controller: _controller,
                    padding: EdgeInsets.fromLTRB(5.0, 1.0, 5.0, 1.0),
                    children: messages
                  ),
                ),
              ),
              Divider(
                color: Theme.of(context).accentColor,
                height: 1,
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
    FocusNode _focus = new FocusNode();

    void _onFocusChange(){
      Timer(Duration(milliseconds: 300), () => _controller.jumpTo(_controller.position.maxScrollExtent));
    }

    void addNewMessage() {
      if (textEditingController.text.trim().isNotEmpty) {
        MessageModel newMessage = MessageModel(textEditingController.text.trim());

        setState(() {
          this.mensajes.add(newMessage);
          textEditingController.text = '';
        });
      }

      Timer(Duration(milliseconds: 300), () => _controller.jumpTo(_controller.position.maxScrollExtent));
    }

    _focus.addListener(_onFocusChange);

    return Container(
      child: Container(
        color: Theme.of(context).accentColor,
        padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
        height: 50.0,      
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: TextField(
                  focusNode: _focus,
                  controller: textEditingController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Escribe tu mensaje',
                    hintStyle: TextStyle(
                      fontSize: 16.0,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  textInputAction: TextInputAction.send,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Theme.of(context).accentColor,
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
                  color: Theme.of(context).primaryColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
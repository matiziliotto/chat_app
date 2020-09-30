import 'package:flutter/material.dart';

// Widgets
import 'package:chat_app/src/pages/chat/widget/mensaje_received.dart';
import 'package:chat_app/src/pages/chat/widget/mensaje_send.dart';

class Chat extends StatefulWidget {

  final Map<String, String> mensajes;
  final String name;
  const Chat(this.mensajes,this.name);

  @override
  _ChatState createState() => _ChatState(mensajes: this.mensajes, name:this.name);
}

class _ChatState extends State<Chat> {
  String name;
  Map<String, String> mensajes;

  _ChatState({this.mensajes, this.name});

  @override
  Widget build(BuildContext context) {
    print(this.mensajes['mensaje1']);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(22, 54, 90, 1),
        leading: new IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => {
              Navigator.of(context).pushReplacementNamed("/principal"),
            }
          ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              // backgroundImage: NetworkImage(_model.avatarUrl), // TODO: image of user
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
      // TODO: por ahora no tendria menu lateral para borrar mensajes y eso
      // endDrawer: Drawer(
      //   child: Container(),
      // ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(5.0, 1.0, 5.0, 1.0),
            child: Column(
              children: [
                MensajeEnviado(this.mensajes['mensaje1'], '09:00'),
                MensajeEnviado(this.mensajes['mensaje2'], '09:00'),
                MensajeRecibido(this.mensajes['mensaje3'], '09:00'),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(15.0),
            height: 61,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(35.0),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 3),
                            blurRadius: 5,
                            color: Colors.grey)
                      ],
                    ),
                    child: Row(
                      children: [
                        IconButton(
                            icon: Icon(Icons.face), onPressed: () {}),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: "Type Something...",
                                border: InputBorder.none),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.photo_camera),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.attach_file),
                          onPressed: () {},
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 15),
                Container(
                  padding: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                      color: Colors.green, shape: BoxShape.circle),
                  child: InkWell(
                    child: Icon(
                      Icons.keyboard_voice,
                      color: Colors.white,
                    ),
                    onLongPress: () {
                      // setState(() {
                      //   _showBottom = true;
                      // });
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
import 'package:chat_app/src/models/Message_model.dart';
import 'package:chat_app/src/pages/chat/Chat.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class ChatItem extends StatelessWidget {
  String name;

  ChatItem(this.name);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        splashColor: Color.fromRGBO(62, 111, 163, 1),
        onTap: () => {
          pushNewScreen(
              context,
              screen: Chat(
                [
                  MessageModel('Hola matias'),
                  MessageModel('Como estas'),
                  MessageModel('Bien, vos?'),
                ], 
                'Matias'
              ),
              withNavBar: false, // OPTIONAL VALUE. True by default.
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
          )
        },
        child: ListTile(
        leading: CircleAvatar(
          // backgroundImage: NetworkImage(_model.avatarUrl), // TODO: image of user
          backgroundImage: NetworkImage('https://simulacionymedicina.es/wp-content/uploads/2015/11/default-avatar-300x300-1.jpg'),
        ),
        title: Row(
          children: <Widget>[
            Text(this.name),
            SizedBox(
              width: 18.0,
            ),
            Text(
              // _model.datetime,
              '09:05'
            ),
          ],
        ),
        subtitle: Text('Message'),
        trailing: Icon(
          Icons.arrow_forward_ios,
        ),
      ),
    );
  }
}
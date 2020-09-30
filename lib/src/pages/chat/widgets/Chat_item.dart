import 'package:flutter/material.dart';

class ChatItem extends StatelessWidget {
  String name;

  ChatItem(this.name);

  @override
  Widget build(BuildContext context) {
    return ListTile(
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
    );
  }
}
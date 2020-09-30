import 'package:flutter/material.dart';

class ChatItem extends StatelessWidget {
  String name;

  ChatItem(this.name);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        // backgroundImage: NetworkImage(_model.avatarUrl), // TODO: image of user
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

// TODO: Una version mas fea
    // return Padding(
    //   padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
    //   child: Container(
    //     decoration: BoxDecoration(
    //       border: Border(
    //         bottom:BorderSide(
    //           color: Colors.grey.shade300,
    //         )
    //       )
    //     ),
    //     child: InkWell(
    //       splashColor: Color.fromRGBO(62, 111, 163, 1),
    //       onTap: () => {
    //         print('Click chat de '+ this.name),
    //       },
    //       child: Container(
    //         height: 100,
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: <Widget>[
    //             Row(
    //               children: <Widget>[
    //                 Icon(Icons.person),
    //                 Padding(
    //                   padding: const EdgeInsets.all(8.0),
    //                   child: Text(
    //                     this.name,
    //                     style: TextStyle(
    //                       fontSize: 17.0
    //                     )
    //                   ),
    //                 ),
    //               ],
    //             ),
                
    //             Icon(Icons.arrow_right),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
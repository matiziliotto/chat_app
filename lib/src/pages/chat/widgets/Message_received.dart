import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageReceived extends StatelessWidget {
  String mensaje;
  String time;

  MessageReceived(this.mensaje, this.time);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 4.0,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text(
              //   "${messages[i]['contactName']}",
              //   style: Theme.of(context).textTheme.caption,
              // ),
              Container(
                constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * .6),
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).disabledColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
                child: Text(
                  this.mensaje,
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 15),
        Text(
          this.time,
          style: TextStyle(
            color: Theme.of(context).accentColor,
          ),
        ),
      ],
    );
  }
}
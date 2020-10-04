import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageSend extends StatelessWidget {
  String mensaje;
  String time;

  MessageSend(this.mensaje, this.time);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          this.time,
          style: TextStyle(
            color: Theme.of(context).accentColor,
          ),
        ),
        SizedBox(width: 15),
        Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Column(
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
                  color: Theme.of(context).focusColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    topLeft: Radius.circular(25),
                    bottomLeft: Radius.circular(25),
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
      ],
    );
  }
}
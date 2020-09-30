import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MensajeRecibido extends StatelessWidget {
  String mensaje;
  String time;

  MensajeRecibido(this.mensaje, this.time);

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
                  color: Colors.grey[350],
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
                child: Text(
                  this.mensaje,
                  style: Theme.of(context).textTheme.body1.apply(
                        color: Colors.black87,
                      ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 15),
        Text(
          this.time,
          style: Theme.of(context).textTheme.body2.apply(color: Colors.grey),
        ),
      ],
    );
  }
}
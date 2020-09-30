import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MensajeEnviado extends StatelessWidget {
  String mensaje;
  String time;

  MensajeEnviado(this.mensaje, this.time);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          this.time,
          style: Theme.of(context).textTheme.body2.apply(color: Colors.grey),
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
                  color: Colors.green[100],
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    topLeft: Radius.circular(25),
                    bottomLeft: Radius.circular(25),
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
      ],
    );
  }
}
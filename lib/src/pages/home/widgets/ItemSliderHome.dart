import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ItemSliderHome extends StatelessWidget {

  final String imagen;
  final String titulo;
  final String texto;

  ItemSliderHome({@required this.imagen,this.titulo,this.texto});

  @override
  Widget build(BuildContext context) {
    final double height=MediaQuery.of(context).size.height;
    final double width=MediaQuery.of(context).size.width;

    return Container(
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            child: CachedNetworkImage(
              imageUrl: "https://clientes.locucionar.com/app_clientes/locucionar_app/imagenes/"+this.imagen,
              errorWidget: (context,url,error) => Icon(Icons.error),
              fadeInCurve: Curves.easeIn,
              placeholder: (context,url) => Container(
                child: Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Color.fromRGBO(40, 56, 73, 1)
                    ),
                  ),
                )
              ),
            )
          ),
          Container(
            margin:EdgeInsets.only(top:height * 0.6,left: width * 0.05,right: width * 0.05),
            child:
            Column(
              children: <Widget>[
                Text(
                  this.titulo,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: width * 0.06,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  this.texto,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: width * 0.045,
                    color: Colors.white,
                  ),
                ),
              ],
            )
          )
        ],
      ),
    );
  }
}
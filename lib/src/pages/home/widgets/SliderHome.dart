import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:chat_app/src/pages/home/widgets/ItemSliderHome.dart';

class SilderHome extends StatefulWidget {
  @override
  _SilderHomeState createState() => _SilderHomeState();
}

class _SilderHomeState extends State<SilderHome> {
  final List<Widget> itemsSlider = <Widget>[];

  PageController _controller;
  int currentItemValue = 0;

  @override
  void initState() {
    super.initState();
    getFotos().then((resultado) {
      if (resultado['error'] == null) {
        for (var item in resultado['items_carrousel']) {
          this.itemsSlider.add(ItemSliderHome(
                imagen: item['imagen'],
                titulo: item['titulo_imagen'],
                texto: item['texto_imagen'],
              ));
        }
      } else {
        Navigator.of(context).pushReplacementNamed('/Login');
      }
      setState(() {});
    });
  }

  Future<Map<String, dynamic>> getFotos() async {
    var respuesta = await http.get(
        "https://clientes.locucionar.com/app_clientes/API/getInfoCarrousel.php");
    if (respuesta.statusCode == 200) {
      //error del json
      return jsonDecode(respuesta.body);
    } else {
      //Error 500 o no se conecto a la api
      return {"error": true};
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Container(
                height: height * 0.28,
                child: PageView.builder(
                    itemCount: this.itemsSlider.length,
                    physics: ClampingScrollPhysics(),
                    onPageChanged: (int page) {
                      getChangedPage(page);
                    },
                    controller: _controller,
                    itemBuilder: (context, index) {
                      if (this.itemsSlider.length == 0) {
                        return Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Color.fromRGBO(41, 171, 226, 1)),
                          ),
                        );
                      } else {
                        return itemsSlider[index];
                      }
                    }),
              ),
            ),
          ],
        ),
        //ACA VAN LO 3 PUNTOS DEL CARRUSEL
        Positioned(
          child: Container(
            margin: EdgeInsets.only(top: height * 0.31),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                for (int i = 0; i < this.itemsSlider.length; i++)
                  if (i == currentItemValue) ...[circleBar(true)] else
                    circleBar(false),
              ],
            ),
          ),
        )
      ],
    );
  }

  void getChangedPage(int page) {
    currentItemValue = page;
    setState(() {});
  }

  Widget circleBar(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 5),
      height: isActive ? 10 : 8,
      width: isActive ? 10 : 8,
      decoration: BoxDecoration(
          color: isActive
              ? Theme.of(context).accentColor
              : Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(12))),
    );
  }
}

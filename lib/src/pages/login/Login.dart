import 'dart:async';

import 'package:flutter/material.dart';
import 'package:delayed_display/delayed_display.dart';

class Login extends StatefulWidget {


  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    ScrollController _controller = ScrollController();

    TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 17.0);
    final _emailField = TextField(
      obscureText: false,
      onTap: () => {
        Timer(Duration(milliseconds: 300), () => _controller.jumpTo(_controller.position.maxScrollExtent))
      },
      style: style,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Email",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0)
        )
      ),
    );

    final _passwordField = TextField(
      obscureText: false,
      onTap: () => {
        Timer(Duration(milliseconds: 300), () => _controller.jumpTo(_controller.position.maxScrollExtent))
      },
      style: style,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0)
        )
      ),
    );

    final _submitButton = RaisedButton(
      splashColor: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      elevation: 5.0,
      onPressed: () {
        Navigator.of(context).pushNamed('/Main');
        //Si el formulario fue validado
        // if (_formKey.currentState.validate()) {
        //   setState(() {
        //     _autenticando = true;
        //   });
        //   this._usuario=this._usuarioController.text;
        //   autenticacion(_usuario, _password);
        // }
      },
      color: Colors.black,
      child: Text(
        "Ingresar",
        style: TextStyle(
          color: Color.fromRGBO(240, 240, 240, 1),
          fontSize: 25.0,
          fontWeight: FontWeight.w300,
        ),
      ),
    );

    final _forgotPassword = GestureDetector(
      onTap: (){
        // Navigator.pushNamed(context, '/RecuperarPassword');
        print('navegar a olvite mi contraseña'); //TODO
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
                text: "Forgot your password?",
                style: TextStyle(
                  color: Color.fromRGBO(240, 240, 240, 1),
                  fontWeight: FontWeight.w400,
                  fontSize: 18.0,
                )),
          ],
        ),
      ),
    );

    final _signUp = GestureDetector(
      onTap: (){
        // Navigator.pushNamed(context, '/RecuperarPassword');
        print('navegar a olvite mi contraseña'); //TODO
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
                text: "Sign in now",
                style: TextStyle(
                  color: Color.fromRGBO(240, 240, 240, 1),
                  fontWeight: FontWeight.w400,
                  fontSize: 18.0,
                )),
          ],
        ),
      ),
    );

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.red,
        child: ListView(
          padding: EdgeInsets.all(0),
          controller: _controller,
          children: [
            Column(
              children: [
                DelayedDisplay(
                  delay: Duration(milliseconds: 100),
                  slidingBeginOffset: const Offset(0.0, -2.0),
                  child: Container(
                    height: height*0.35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
                      color: Colors.grey[400]
                    ),
                    child: Center(
                      child: Image(
                        image: NetworkImage('https://simulacionymedicina.es/wp-content/uploads/2015/11/default-avatar-300x300-1.jpg'),
                      ),
                    ),
                  ),
                ),
                
                SizedBox(
                  height: height * 0.02,
                ),
                
                DelayedDisplay(
                  delay: Duration(milliseconds: 200),
                  slidingBeginOffset: const Offset(0.0, -2.0),
                  child: Container(
                    alignment: Alignment.bottomLeft,
                    padding: EdgeInsets.only(left: width * 0.05),
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 40,
                        fontFamily: 'Verdana',
                        color: Colors.white,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: height * 0.005,
                ),
                
                DelayedDisplay(
                  delay: Duration(milliseconds: 600),
                  slidingBeginOffset: const Offset(2.0, 0.0),
                  child: Container(
                    alignment: Alignment.center,
                    child: Form(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            _emailField,
                            SizedBox(
                              height: height * 0.015,
                            ),
                            _passwordField,
                            SizedBox(
                              height: height * 0.03,
                            ),
                            _submitButton,
                          ],
                        ),
                      ),
                    )
                  ),
                ),
                DelayedDisplay(
                  delay: Duration(milliseconds: 600),
                  slidingBeginOffset: const Offset(-2.0, 0.0),
                  child: _forgotPassword,
                ),
                SizedBox(
                  height: height * 0.025,
                ),
                DelayedDisplay(
                  delay: Duration(milliseconds: 800),
                  slidingBeginOffset: const Offset(-2.0, 0.0),
                  child: _signUp,
                ),
                SizedBox(
                  height: height * 0.025,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
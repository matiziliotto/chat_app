import 'dart:async';

import 'package:chat_app/src/pages/Main.dart';
import 'package:flutter/material.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:progress_indicators/progress_indicators.dart';

class Login extends StatefulWidget {


  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  ScrollController _controller = ScrollController();
  
  final FocusNode _email = FocusNode();
  final FocusNode _password = FocusNode();
  
  bool _autenticando = false;

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 17.0);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    final _emailField = TextFormField(
      focusNode: _email,
      onFieldSubmitted: (data){
        cambiarFocoCampo(context, _email, _password);
      },
      obscureText: false,
      onTap: () => {
        Timer(Duration(milliseconds: 300), () => _controller.jumpTo(_controller.position.maxScrollExtent))
      },
      style: style,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Email",
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black87,
            width: 1.5
          ),
          borderRadius: BorderRadius.circular(25.0),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
        )
      ),
    );

    final _passwordField = TextFormField(
      focusNode: _password,
      obscureText: false,
      onTap: () => {
        Timer(Duration(milliseconds: 300), () => _controller.jumpTo(_controller.position.maxScrollExtent))
      },
      style: style,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Password",
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black87,
            width: 1.5
          ),
          borderRadius: BorderRadius.circular(25.0),
        ),
        border: OutlineInputBorder( 
          borderRadius: BorderRadius.circular(32.0),
        )
      ),
    );

    final _submitButton = RaisedButton(
      splashColor: Theme.of(context).primaryColor,
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      elevation: 5.0,
      onPressed: () {
        setState(() {
          _autenticando = true;
        });
        var duration = new Duration(seconds: 2);
        new Timer(duration, () => {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Main(),))
        });
        //Si el formulario fue validado
        // if (_formKey.currentState.validate()) {
        //   setState(() {
        //     _autenticando = true;
        //   });
        //   this._usuario=this._usuarioController.text;
        //   autenticacion(_usuario, _password);
        // }
      },
      color: Theme.of(context).buttonColor,
      child: Text(
        "Ingresar",
        style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontSize: 25.0,
          fontWeight: FontWeight.w300,
        ),
      ),
    );

    final _forgotPassword = GestureDetector(
      onTap: (){
        // Navigator.pushNamed(context, '/RecuperarPassword');
        print('Navigate to Forgot your password'); //TODO
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
                text: "Forgot your password?",
                style: TextStyle(
                  color: Theme.of(context).accentColor,
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
        print('Navigate to Sign up now'); //TODO
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
                text: "Sign in now",
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 18.0,
                )),
          ],
        ),
      ),
    );

    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Theme.of(context).backgroundColor,
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
                        borderRadius: BorderRadius.all(Radius.circular(75)),
                        color: Theme.of(context).secondaryHeaderColor,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.person,
                          size: 200,
                          color: Theme.of(context).primaryColor,
                        ),
                        // child: Image(
                        //   image: NetworkImage('https://simulacionymedicina.es/wp-content/uploads/2015/11/default-avatar-300x300-1.jpg'),
                        // ),
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
                          color: Theme.of(context).accentColor,
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
                              _autenticando == false ? _submitButton : JumpingDotsProgressIndicator(dotSpacing: 2.0, fontSize: 50.0, milliseconds: 200,),
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
      ),
    );
  }

  void cambiarFocoCampo( BuildContext context, FocusNode focoActual, FocusNode focoSiguiente) {
    focoActual.unfocus();
    FocusScope.of(context).requestFocus(focoSiguiente);
  }
}
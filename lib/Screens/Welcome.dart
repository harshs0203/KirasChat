import 'package:flutter/material.dart';
import 'package:kiras_chat/Screens/Auth/Login.dart';
import 'package:kiras_chat/Screens/Auth/Register.dart';
import 'package:kiras_chat/components/roundedButton.dart';
// ignore: implementation_imports
import 'package:animated_text_kit/src/typewriter.dart';
class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue[900],
              Colors.blue[200],
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Hero(
                    tag: 'logo',
                    child: Container(
                      child: Image.asset('images/KirasChat Logo.png'),
                      height: 70.0,
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  TypewriterAnimatedTextKit(
                    text: ['KIRAS CHAT'],
                    speed: Duration(milliseconds: 80),
                    totalRepeatCount: 100,
                    textStyle: TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'PaytoneOne',
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 48.0,
              ),
              RoundedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                colour: Colors.white,
                title: 'Log In',
                width: 200,
              ),
              RoundedButton(
                  width: 200,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Register()
                      ),
                    );
                  },
                  colour: Colors.white,
                  title: 'Register'),
            ],
          ),
        ),
      ),
    );
  }
}

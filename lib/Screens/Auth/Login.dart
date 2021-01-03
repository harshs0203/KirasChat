import 'package:flutter/material.dart';
import 'package:kiras_chat/Services/AuthService.dart';
import 'package:kiras_chat/components/roundedButton.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService _auth = AuthService();
  String email;
  String password;

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
          child: Center(
            child: Form(
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  TextFormField(
                    onChanged: (val){
                      setState(() {
                        email = val;
                      });
                    },
                  ),
                  SizedBox(height: 20.0,),
                  TextFormField(
                    obscureText: true,
                    onChanged: (val){
                      setState(() {
                        password = val;
                      });
                    },
                  ),
                  RoundedButton(
                      onPressed: () async{
                        dynamic result= await _auth.signIn(email, password);
                        if(result == null){
                          print('error');
                        }else{
                          print('successful');
                          print(result);
                        }
                  },
                    colour: Colors.white,
                    title: 'Log In',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:kiras_chat/Screens/ChatScreen/ChatScreen.dart';
import 'package:kiras_chat/Services/AuthService.dart';
import 'package:kiras_chat/components/roundedButton.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

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
          padding: EdgeInsets.symmetric(horizontal: 50.0,vertical: 20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    errorStyle: TextStyle(color: Colors.white),
                    hintText: 'Email',
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                  validator: (val) =>
                      val.isEmpty ? 'This field can not be empty' : null,
                  onChanged: (val) {
                    setState(() {
                      email = val;
                    });
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    errorStyle: TextStyle(color: Colors.white),
                    hintText: 'Password',
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                  validator: (val) => val.length < 6
                      ? 'Password should of at least of 6 characters'
                      : null,
                  obscureText: true,
                  onChanged: (val) {
                    setState(() {
                      password = val;
                    });
                  },
                ),
                RoundedButton(
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      dynamic result = await _auth.logIn(email, password);
                      if (result == null) {
                        print('error');
                      } else {
                        print('successful');
                        print(result.uid);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChatScreen()),
                        );
                      }
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
    );
  }
}

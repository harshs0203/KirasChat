import 'package:flutter/material.dart';
import 'package:kiras_chat/Screens/ChatScreen/ChatScreen.dart';
import 'package:kiras_chat/Services/AuthService.dart';
import 'package:kiras_chat/components/AlertDialog.dart';
import 'package:kiras_chat/components/roundedButton.dart';
import 'package:kiras_chat/constants.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart' ;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool showSpinner = false;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
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
            child: ListView(
              padding: EdgeInsets.only(top: 180.0),
              children: [
                Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/KirasChat Logo.png'),
                  ),
                ),
                SizedBox(
                  height: 48.0,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                        keyboardType: TextInputType.emailAddress,
                        decoration: kTextFieldDecoration.copyWith(hintText: 'Enter Your Email'),
                        validator: (val) =>
                            val.isEmpty ? !val.contains('@') ? 'Email invalid':'This field can not be empty' : null,
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
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                        decoration: kTextFieldDecoration.copyWith(hintText: 'Enter Your Password'),
                        validator: (val) => val.isEmpty
                            ? 'Password should not be null'
                            : null,
                        obscureText: true,
                        onChanged: (val) {
                          setState(() {
                            password = val;
                          });
                        },
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      RoundedButton(
                        onPressed: () {
                            securityCheck();
                        },
                        colour: Colors.white,
                        title: 'Log In',
                        width: 200,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  securityCheck() async{
    try {
      if (_formKey.currentState.validate()) {
        setState(() {
          showSpinner = true;
        });
        dynamic result = await _auth.logIn(email, password, context);
        if (result == null) {
          setState(() {
            showSpinner = false;
          });
        } else {
          setState(() {
            showSpinner = false;
          });
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ChatScreen()),
          );
        }
      }
    }catch(e){
      setState(() {
        showSpinner = false;
      });
      showDialog(context: context,child: ErrorPopup(content: Text('$e.')));
    }
  }


}

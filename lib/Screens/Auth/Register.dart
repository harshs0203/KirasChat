import 'package:flutter/material.dart';
import 'package:kiras_chat/Screens/ChatScreen/ChatScreen.dart';
import 'package:kiras_chat/components/roundedButton.dart';
import 'package:kiras_chat/Services/AuthService.dart';

import '../../constants.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  String stream;
  int selectedRadio;

  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
  }

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
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: ListView(
            padding: EdgeInsets.only(top: 120.0),
            children: [
              Hero(
                tag: 'logo',
                child: Container(
                  height: 180.0,
                  child: Image.asset('images/KirasChat Logo.png'),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    TextFormField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.text,
                      style: TextStyle(color: Colors.white),
                      decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Enter your Name'),
                      validator: (val) =>
                          val.isEmpty ? 'This field can not be empty' : null,
                      onChanged: (val) {
                        setState(() {
                          email = val;
                        });
                      },
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Select Your Stream',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            fontSize: 30.0,
                            fontFamily: 'PaytoneOne',
                          ),
                        ),
                        RadioListTile(
                            value: 1,
                            groupValue: selectedRadio,
                            title: Text("BCA",
                              style:
                              TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: 20.0,
                              fontFamily: 'PaytoneOne',
                              ),
                            ),
                          secondary: Icon(
                                  Icons.computer_sharp,
                                  color: Colors.white,
                                ),
                            activeColor: Colors.white70,
                            selected: true,
                            onChanged: (val){
                              selectedRadioTile(val);
                              streamSelect();
                              print('radio $stream');
                            }
                        ),
                        RadioListTile(
                            value: 2,
                            groupValue: selectedRadio,
                            title: Text("B.ed",
                              style:
                              TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                fontSize: 20.0,
                                fontFamily: 'PaytoneOne',
                              ),
                            ),
                            secondary: Icon(
                              Icons.school_outlined,
                              color: Colors.white,
                            ),
                            activeColor: Colors.white70,
                            selected: true,
                            onChanged: (val){
                              selectedRadioTile(val);
                              streamSelect();
                              print('radio $stream');
                            }
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                    TextFormField(
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                      keyboardType: TextInputType.emailAddress,
                      validator: (val) =>
                      val.isEmpty ? 'This field can not be empty' : null,
                      onChanged: (value) {
                        email = value;
                      },
                      decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Enter your Email'),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    TextFormField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.text,
                      style: TextStyle(color: Colors.white),
                      obscureText: true,
                      validator: (val) => val.length < 6
                          ? 'Password should be of at least 6 characters'
                          : null,
                      onChanged: (value) {
                        password = value;
                      },
                      decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Enter your Password'),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    RoundedButton(
                      width: 200,
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          dynamic result =
                              await _auth.register(email, password);
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
                      title: 'Register',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  selectedRadioTile(int val){
    setState(() {
      selectedRadio = val;
    });
  }

  void streamSelect(){
    setState(() {
      if(selectedRadio == 1){
        stream = 'BCA';
      }else{
        stream = 'Bed';
      }
    });
  }

  // bool securityCheck() async{
  //   if(id.length == 11){
  //     if(id.contains('144',3 )|| id == kTeachersNumber){ //TODO: Strengthen the security.
  //       try {
  //         if (_formKey.currentState.validate()) {
  //           dynamic result =
  //               await _auth.register(email, password);
  //           if (result == null) {
  //             print('error');
  //           } else {
  //             print('successful');
  //             print(result.uid);
  //             Navigator.push(
  //               context,
  //               MaterialPageRoute(
  //                   builder: (context) => ChatScreen()),
  //             );
  //           }
  //         }
  //         if(newUser != null && fieldType == 'Enrollment Number'){
  //           Navigator.pushNamed(context, FeedScreen.id);
  //         }else if(newUser != null && fieldType == 'Teacher\'s Number'){
  //           setState(() {
  //             showSpinner = false;
  //           });
  //           Navigator.pushNamed(context, Post.id);
  //         }
  //       }catch(e){
  //         setState(() {
  //           showSpinner = false;
  //         });
  //         showDialog(context: context,child: ErrorPopup(content: Text('$e.')));
  //       }
  //     }else{
  //       showDialog(context: context,child: ErrorPopup(title:Text('Sorry, the number is invalid'),content: Text('The number you have entered is not with relevance to the college.')));
  //     }
  //   }else{
  //     showDialog(context: context, child: ErrorPopup(title: Text('Invalid Number'),content: Text('The number you have entered is too long or too short.')));
  //   }
  //
  //   return
  // }

}


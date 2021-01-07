import 'package:flutter/material.dart';
import 'package:kiras_chat/Screens/ChatScreen/ChatScreen.dart';
import 'package:kiras_chat/components/AlertDialog.dart';
import 'package:kiras_chat/components/roundedButton.dart';
import 'package:kiras_chat/Services/AuthService.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
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
  String id;
  bool showSpinner = false;
  bool checkBoxValue = false;
  String fieldType = 'Enrollment Number';

  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
  }

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
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: ListView(
              padding: EdgeInsets.only(top: 185.0),
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
                      CheckboxListTile(
                          title: Text(
                            'Are You A Teacher?',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                          secondary: Icon(
                            Icons.person_outline,
                            color: Colors.white,
                          ),
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: Colors.white,
                          checkColor: Colors.blue[500],
                          value: checkBoxValue,
                          onChanged: (bool value) {
                            setState(() {
                              if (checkBoxValue == false) {
                                checkBoxValue = value;
                                fieldType = 'Teacher\'s Number';
                              } else {
                                checkBoxValue = value;
                                fieldType = 'Enrollment Number';
                              }
                            });
                          }),
                      SizedBox(
                        height: 1.0,
                      ),
                      TextFormField(
                        validator: (val) =>
                            val.isEmpty ? 'This field can not be empty' : null,
                        textAlign: TextAlign.center,
                        obscureText: true,
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Colors.white),
                        onChanged: (value) {
                          id = value;
                        },
                        decoration: kTextFieldDecoration.copyWith(
                            hintText: 'Enter your $fieldType'),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Text(
                          //   'Select Your Stream',
                          //   style: TextStyle(
                          //       fontWeight: FontWeight.w500,
                          //       color: Colors.white,
                          //     fontSize: 30.0,
                          //     fontFamily: 'PaytoneOne',
                          //   ),
                          // ),
                          // RadioListTile(
                          //     value: 1,
                          //     groupValue: selectedRadio,
                          //     title: Text("BCA",
                          //       style:
                          //       TextStyle(
                          //       fontWeight: FontWeight.w500,
                          //       color: Colors.white,
                          //       fontSize: 20.0,
                          //       fontFamily: 'PaytoneOne',
                          //       ),
                          //     ),
                          //   secondary: Icon(
                          //           Icons.computer,
                          //            color: Colors.white,
                          //         ),
                          //     activeColor: Colors.white70,
                          //     selected: true,
                          //     onChanged: (val){
                          //       selectedRadioTile(val);
                          //       streamSelect();
                          //       print('radio $stream');
                          //     }
                          // ),
                          // RadioListTile(
                          //     value: 2,
                          //     groupValue: selectedRadio,
                          //     title: Text("B.ed",
                          //       style:
                          //       TextStyle(
                          //         fontWeight: FontWeight.w500,
                          //         color: Colors.white,
                          //         fontSize: 20.0,
                          //         fontFamily: 'PaytoneOne',
                          //       ),
                          //     ),
                          //     secondary: Icon(
                          //       Icons.school,
                          //       color: Colors.white,
                          //     ),
                          //     activeColor: Colors.white70,
                          //     selected: true,
                          //     onChanged: (val){
                          //       selectedRadioTile(val);
                          //       streamSelect();
                          //       print('radio $stream');
                          //     }
                          // ),
                          SizedBox(
                            height: 20.0,
                          ),
                        ],
                      ),
                      TextFormField(
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                        keyboardType: TextInputType.emailAddress,
                        validator: (val) => val.isEmpty
                            ? val.contains('@kiras.com')
                                ? 'Email format is wrong'
                                : 'This field can not be empty'
                            : null,
                        onChanged: (value) {
                          email = value;
                        },
                        decoration: kTextFieldDecoration.copyWith(
                            hintText: 'Email as: firstname_lastname@kiras.com'),
                      ),
                      SizedBox(
                        height: 20.0,
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
                        height: 20.0,
                      ),
                      RoundedButton(
                        width: 220,
                        onPressed: () {
                          securityCheck();
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
      ),
    );
  }

  selectedRadioTile(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  void streamSelect() {
    setState(() {
      if (selectedRadio == 1) {
        stream = 'BCA';
      } else {
        stream = 'Bed';
      }
    });
  }

  void securityCheck() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        showSpinner = true;
      });
      if (id.length == 11) {
        try {
          if (id.substring(3, 6) == '144' || id == kTeachersNumber) {
            if (email.contains('@kiras.com')) {
              dynamic result = await _auth.register(email, password);
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
                  MaterialPageRoute(builder: (context) => ChatScreen()),
                );
              }
            } else {
              setState(() {
                showSpinner = false;
              });
              showDialog(
                context: context,
                child: ErrorPopup(
                  title: Text('Invalid email Format'),
                  content: Text(
                      'The email you have entered is not with relevance to the college.'),
                ),
              );
            }
          } else {
            setState(() {
              showSpinner = false;
            });
            showDialog(
                context: context,
                child: ErrorPopup(
                    title: Text('Sorry, the number is invalid'),
                    content: Text(
                        'The number you have entered is not with relevance to the college.')));
          }
        } catch (e) {
          setState(() {
            showSpinner = false;
          });
          showDialog(
              context: context,
              child: ErrorPopup(title: Text('ERROR'), content: Text('$e')));
        }
      } else {
        setState(() {
          showSpinner = false;
        });
        showDialog(
            context: context,
            child: ErrorPopup(
                title: Text('Invalid Number'),
                content: Text(
                    'The number you have entered is too long or too short.')));
      }
    } else {
      return null;
    }
  }
}

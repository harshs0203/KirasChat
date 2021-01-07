import 'package:flutter/material.dart';
import 'package:kiras_chat/Services/AuthService.dart';
import 'package:kiras_chat/components/MessageStream.dart';
import 'package:kiras_chat/constants.dart';
import 'package:kiras_chat/Services/DatabaseServices.dart';
import 'package:kiras_chat/models/UserModel.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageTextController = TextEditingController();
  final AuthService _auth = AuthService();
  final Database _bca = Database();
  String messageText;
  final messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          child: Image.asset('images/KirasChat Logo.png',
          ),
        ),
        bottomOpacity: 0,
        backgroundColor: Colors.blue[800],
        elevation: 0,
        title: Text(
          'KIRAS Chat',
          style: TextStyle(color: Colors.white, fontSize: 30,fontFamily: 'PaytoneOne',),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.cancel),
            onPressed: () async {
              setState(() {
                Navigator.pop(context);
                _auth.signOut();
              });
            },
            iconSize: 30.0,
            color: Colors.white,
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white,
                Colors.white,
              ],
              begin: Alignment.topLeft,
              end: Alignment.center,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MessageStream(),
                Container(
                  decoration: kMessageContainerDecoration,
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            controller: messageTextController,
                            onChanged: (value) {
                              messageText = value;
                            },
                            decoration: kMessageTextFieldDecoration,
                          ),
                        ),
                        FlatButton(
                          onPressed: () {
                            messageTextController.clear();
                            _bca.addingDataToBcaFireStore(messageText, _auth.getCurrentUser());
                          },
                          child: Text(
                            'Send',
                            style: kSendButtonTextStyle,
                          ),
                        ),
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kiras_chat/Services/AuthService.dart';
import 'package:kiras_chat/constants.dart';
import 'package:kiras_chat/Services/DatabaseServices.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final AuthService _auth = AuthService();
  final Database _bca = Database();
  String messageText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottomOpacity: 0,
        backgroundColor: Color(0xff),
        elevation: 0,
        title: Text(
          'KIRAS Chat',
          style: TextStyle(color: Colors.blue[900], fontSize: 30),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.cancel),
            onPressed: () async {
              _bca.getMessagesFromFireStore();
              //_auth.signOut();
            },
            iconSize: 30.0,
            color: Colors.blue[900],
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              StreamBuilder<QuerySnapshot>(
                  stream: _bca.bcaCollection.snapshots(),
                  // ignore: missing_return
                  builder: (context, snapshot){
                    if(!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.blue[800],
                        ),
                      );
                    }
                      final messages = snapshot.data.docs;
                      List<Text> messageWidgets = [];
                      for (var message in messages) {
                        //final messagesText = message.data().containsKey('text');
                        final messagesText = message.data()['text'];
                        final messagesSender = message.data()['sender'];
                        final messageWidget = Text(
                            '$messagesText from $messagesSender');
                        messageWidgets.add(messageWidget);
                      }
                      return Expanded(
                        child: ListView(
                          padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 20.0),
                          children: messageWidgets,
                        ),
                      );
                  }),
              Container(
                decoration: kMessageContainerDecoration,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          //controller: messageTextController,
                          onChanged: (value) {
                            messageText = value;
                          },
                          decoration: kMessageTextFieldDecoration,
                        ),
                      ),
                      FlatButton(
                        onPressed: () {
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
    );
  }
}

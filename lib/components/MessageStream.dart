import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kiras_chat/Services/AuthService.dart';
import 'package:kiras_chat/Services/DatabaseServices.dart';
import 'ChatBubble.dart';

class MessageStream extends StatelessWidget {
  final Database _bca = Database();
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _bca.bcaCollection.orderBy('timestamp',descending: false).snapshots(),
        builder: (context, snapshot){
          if(!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.blue[800],
              ),
            );
          }
          final messages = snapshot.data.documents.reversed;
          List<MessageBubble> messageBubbles = [];
          for (var message in messages) {
            final messageText = message.data()['text'];
            final messagesSender = message.data()['sender'];
            final messageTimeStamp = message.data()['timestamp'];
            final currentUser = _auth.getCurrentUser();

            final messageBubble =  MessageBubble(
              sender: messagesSender,
              text: messageText,
              isTheUser: currentUser == messagesSender,
              dateTime: messageTimeStamp,
            );
            messageBubbles.add(messageBubble);
          }
          return Expanded(
            child: ListView(
              reverse: true,
              padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 20.0),
              children: messageBubbles,
            ),
          );
        });
  }


}


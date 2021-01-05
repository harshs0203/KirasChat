import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {

  final String sender;
  final String text;
  final bool isTheUser;
  MessageBubble({this.sender,this.text,this.isTheUser});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: isTheUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(sender,
          style: TextStyle(
            fontSize: 12.0,
            color: Colors.black54,
          ),
          ),
          Material(
            borderRadius: isTheUser ? BorderRadius.only(topLeft: Radius.circular(40.0),
            bottomLeft: Radius.circular(40.0),
            bottomRight: Radius.circular(40.0),
            ) : BorderRadius.only(
              topRight: Radius.circular(40.0),
              bottomRight: Radius.circular(40.0),
              bottomLeft: Radius.circular(40.0),
            ),
            elevation: 5.0,
            color: isTheUser ? Colors.blue[800] : Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
              child: Text(
                  '$text ',
              style: TextStyle(
                color: isTheUser ? Colors.white : Colors.black87,
                fontSize: 15.0,
              ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

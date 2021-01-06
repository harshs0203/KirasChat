import 'package:flutter/material.dart';

const kSendButtonTextStyle = TextStyle(
  color: Color(0Xff1565c0),
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);
const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color:Color(0Xff1565c0), width: 2.0),
  ),
);

String kTeachersNumber = '70657085123';

const kTextFieldDecoration = InputDecoration(
  errorStyle: TextStyle(color: Colors.white),
  hintText: 'Enter your value',
  hintStyle: TextStyle(color: Colors.white54),
  contentPadding:
  EdgeInsets.symmetric(vertical: 9.0, horizontal: 19.5),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 2.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 3.0),
  ),
);
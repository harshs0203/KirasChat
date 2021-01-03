import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kiras_chat/Screens/Welcome.dart';
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return WelcomeScreen();
  }
}

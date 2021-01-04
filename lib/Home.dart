import 'package:flutter/material.dart';
import 'package:kiras_chat/Screens/ChatScreen/ChatScreen.dart';
import 'package:kiras_chat/Screens/Welcome.dart';
import 'package:kiras_chat/models/UserModel.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserFromFirebase>(context);
    if(user == null){
     return WelcomeScreen();
    }else{
      return ChatScreen();
    }
  }
}

import 'package:flutter/material.dart';
import 'package:kiras_chat/Home.dart';
import 'package:kiras_chat/Services/AuthService.dart';
import 'package:kiras_chat/models/UserModel.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return StreamProvider<UserFromFirebase>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Home(),
      ),
    );
  }
}

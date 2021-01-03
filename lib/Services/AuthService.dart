import 'package:firebase_auth/firebase_auth.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //register
  Future register(String email, String password) async{
    try{
      var result =  (await _auth.createUserWithEmailAndPassword(email: email, password: password)) as AuthService;
      var user = result._auth.currentUser;
      return user;
    }catch(e){
      print(e);
      return null;
    }
  }
  // sign in
  Future signIn(String email, String password) async{
    try{
      var result =  (await _auth.signInWithEmailAndPassword(email: email, password: password)) as AuthService;
      var user = result._auth.currentUser;
      return user;
    }catch(e){
      print(e);
      return null;
    }
  }
  //sign out
}
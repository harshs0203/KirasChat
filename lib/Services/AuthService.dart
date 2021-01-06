import 'package:firebase_auth/firebase_auth.dart';
import 'package:kiras_chat/models/UserModel.dart';

import '../models/UserModel.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user object based on FireBaseUser
   UserFromFirebase _gettingUserInfo(var user){
    return user != null ? UserFromFirebase(uid: user.uid) : null;
  }

  //authentication change
  Stream<UserFromFirebase> get user{
     return _auth.onAuthStateChanged
         .map((var user) => _gettingUserInfo(user));
  }

  //register
  Future register(String email, String  password) async{
    try{
      var result =  await _auth.createUserWithEmailAndPassword(email: email, password: password);
      var user = result.user;
     return _gettingUserInfo(user);
    }catch(e){
      return e;
    }
  }

  // sign in
  Future logIn(String email, String password) async{
    try{
      var result =  await _auth.signInWithEmailAndPassword(email: email, password: password);
      var user = result.user;
      return _gettingUserInfo(user);
    }catch(e){
      return e;
    }
  }

  //sign out
  Future signOut() async{
     try{
       return await _auth.signOut();
     }catch(e){
       print(e);
     }
  }

  //getting current user data
  String getCurrentUser()  {
     return _auth.currentUser.email;
  }
}
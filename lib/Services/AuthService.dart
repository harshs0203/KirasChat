import 'package:firebase_auth/firebase_auth.dart';
import 'package:kiras_chat/models/user.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;
  // create user object based on FireBaseUser
  UserInfo _gettingUserInfo(FirebaseUser user){
    if (user != null) {
      return UserInfo(uid:user.uid);
    } else {
      return null;
    }
  }

  //register
  Future register() async{
    try{
      var result =  await _auth.signInAnonymously();
      var user = result.user;
     // return _userFromFireBase(user);
      return _gettingUserInfo(user);
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
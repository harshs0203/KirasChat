import 'package:firebase_auth/firebase_auth.dart';

class User{
  final String uid;
  final String email;
  final bool bca;
  final bool teacher;

  // ignore: non_constant_identifier_names
  User.UserInfo({this.uid,
    this.email,
    this.bca,
    this.teacher
    });

  // gettingUserInfo(FirebaseUser user) async {
  //   if (user != null) {
  //     return User.UserInfo(uid: user.uid);
  //   } else {
  //     return null;
  //   }
  // }

}
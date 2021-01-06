class UserFromFirebase{
  final String uid;
  final String email;
  final String stream;
  final bool teacher;

  // ignore: non_constant_identifier_names
  UserFromFirebase({this.uid,
    this.email,
    this.stream,
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
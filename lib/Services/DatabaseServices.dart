import 'package:cloud_firestore/cloud_firestore.dart';

class Database{
  final String uid;
  Database({this.uid});
  // ignore: deprecated_member_use
  final CollectionReference bcaCollection = Firestore.instance.collection('BcaMessage');
  void addingDataToBcaFireStore(String message, var sender){
    if(message != null) {
      bcaCollection.add({
        'text': message,
        'sender': sender,
        'timestamp' : FieldValue.serverTimestamp(),
      });
    }
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class Database{

  final String uid;
  Database({this.uid});

  // ignore: deprecated_member_use
  final CollectionReference bcaCollection = Firestore.instance.collection('BcaMessage');
  String timeStamp = DateFormat('kk:mm:ss \n EEE d MMM').format(DateTime.now());
  void addingDataToBcaFireStore(String message, var sender){
    if(message != null) {
      bcaCollection.add({
        'text': message,
        'sender': sender,
        'timestamp' : timeStamp
      });
    }
  }

  // void getMessagesFromFireStore()async{
  //   await for( var snapshots in bcaCollection.orderBy('timestamp',descending: true).snapshots()){
  //     // ignore: deprecated_member_use
  //     for(var messages in snapshots.documents){
  //       print(messages.data());
  //     }
  //   }
  // }

}
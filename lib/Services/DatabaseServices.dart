import 'package:cloud_firestore/cloud_firestore.dart';
class Database{

  final String uid;
  Database({this.uid});

  // ignore: deprecated_member_use
  final CollectionReference bcaCollection = Firestore.instance.collection('BcaMessage');
  
  void addingDataToBcaFireStore(String message, var sender){
    bcaCollection.add({
      'text' : message,
      'sender' : sender,
    });
  }

  void getMessagesFromFireStore()async{
    await for( var snapshots in bcaCollection.snapshots()){
      // ignore: deprecated_member_use
      for(var messages in snapshots.documents){
        print(messages.data());
      }
    }
  }

}
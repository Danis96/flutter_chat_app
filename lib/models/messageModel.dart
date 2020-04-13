import 'package:cloud_firestore/cloud_firestore.dart';

class MessageChat {
  final String sender;
  final String reciever;
  final String content;
  final String timestamp;

  MessageChat({this.content, this.reciever, this.sender, this.timestamp});

  factory MessageChat.fromDocument(DocumentSnapshot doc) {
     return MessageChat(
       sender: doc['emailFrom'],
       reciever: doc['emailTo'],
       content: doc['content'],
       timestamp: doc['timestamp']
     );
  } 
}
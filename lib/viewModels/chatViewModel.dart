import 'package:c/interface/chatRoomInterface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

class ChatViewModel implements ChatroomInterface {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Firestore _firestore = Firestore.instance;
  final db = Firestore.instance;

  @override
  Future<void> sendMsg(
    TextEditingController messageController,
    String email,
    String name,
    FirebaseUser user,
    ScrollController scrollController,
  ) async {
    if (messageController.text.length > 0) {
      String msg = messageController.text;

      var documentReference = db
        .collection('Messages')
        .document(user.email + '-' + email)
        .collection(user.email + '-' + email)
        .document(DateTime.now().millisecondsSinceEpoch.toString());

      Firestore.instance.runTransaction((transaction) async {
      await transaction.set(
        documentReference,
        {
          'emailFrom': user.email,
          'emailTo': email,
          'timestamp': DateTime.now().millisecondsSinceEpoch.toString(),
          'content': msg,
        },
      );
    });
      messageController.clear();
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 300),
      );
    }
  }

  @override
  Future getMessages() async {
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore.collection('Messages').getDocuments();
    return qn.documents;
  }
}

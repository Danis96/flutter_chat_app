import 'package:c/interface/chatRoomInterface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

class ChatViewModel implements ChatroomInterface {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Firestore _firestore = Firestore.instance;

  @override
  Future<void> sendMsg(TextEditingController messageController, String email,
      String name, FirebaseUser user, ScrollController scrollController) async {
    if (messageController.text.length > 0) {
      String msg = messageController.text;
      String dateNow = DateTime.now().toIso8601String().toString();

      await _firestore.collection('Users').document(user.email).updateData({
        'chat$name': FieldValue.arrayUnion([
            'from : $email, to :  $name, msg : $msg, date: $dateNow',
        ])
      });
      messageController.clear();
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 300),
      );
    }
  }
}

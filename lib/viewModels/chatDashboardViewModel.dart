import 'package:c/interface/chatDashInterface.dart';
import 'package:c/views/chat_room/pages/chat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatDashboardViewModel implements ChatDashFirebase {
  /// get users
  @override
  Future getFriends() async {
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore.collection('Users').getDocuments();
    return qn.documents;
  }

  @override
  navigateTo(
    BuildContext context,
    String name,
    FirebaseUser user,
    String email,
  ) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => Chat(user: user, withChat: name, email: email)));
  }
}

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

  final db = Firestore.instance;

  
  /// on user tap create chat with that user
  
  
  @override
  createChat(DocumentSnapshot doc, String name, FirebaseUser user,
      BuildContext context) async {
    await db.collection('Users').document(user.email).updateData({'chat$name':[]});


    Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => Chat(user: user, withChat: name)));
  }

  @override
  navigateTo( BuildContext context,String name, FirebaseUser user, ) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => Chat(user: user, withChat: name)));
  }

  
}

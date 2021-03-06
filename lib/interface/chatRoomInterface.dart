import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class ChatroomInterface {
  Future<void> sendMsg(TextEditingController messageController, String email,
      String name, FirebaseUser user, ScrollController scrollController);
  Future getMessages(
    String email,
    FirebaseUser user,
  );
}

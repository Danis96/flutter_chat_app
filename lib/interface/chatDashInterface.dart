
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class ChatDashFirebase {
   Future getFriends();
   createChat(DocumentSnapshot doc, String name, FirebaseUser user,BuildContext context);
}
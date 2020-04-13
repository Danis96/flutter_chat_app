
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class ChatDashFirebase {
   Future getFriends();
   navigateTo(BuildContext context,String name, FirebaseUser user, String email);
}
import 'package:c/views/chat_dashboard/pages/dashboard.dart';
import 'package:c/views/home/pages/signupScreenView.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreenViewModel {
  loginUser(BuildContext context, String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ChatDashboard()),
      );
    } catch (e) {
      print(e.toString());
    }
  }

  signupOnSignin(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SignupScreenView()),
      );
  }

  Future forgotPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e.toString());
    }
  }
}

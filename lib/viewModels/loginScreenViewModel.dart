import 'package:c/views/chat_dashboard/pages/dashboard.dart';
import 'package:c/views/home/pages/signupScreenView.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';



class LoginScreenViewModel {
  loginUser(BuildContext context, String email, String password) async {
    try {
      AuthResult result =  await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ChatDashboard(user)),
      );
    } catch (e) {
      print(e.toString());
    }
  }

  signupOnSignin(BuildContext context) {
    Navigator.pushReplacement(
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

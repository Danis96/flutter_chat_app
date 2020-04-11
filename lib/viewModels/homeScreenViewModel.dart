import 'package:c/views/home/pages/loginScreenView.dart';
import 'package:c/views/home/pages/signupScreenView.dart';
import 'package:flutter/material.dart';

class HomeScreenViewModel {
  loginOnHomeScreen(BuildContext context, String email, String password) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginScreenView()),
    );
  }

  signupOnHomeScreen(BuildContext context, String email, String password, String name) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignupScreenView()),
    );
  }
}

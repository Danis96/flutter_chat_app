import 'package:c/utils/constants.dart';
import 'package:c/utils/globals.dart';
import 'package:flutter/material.dart';

class ForgotPasswordButton extends StatelessWidget {
  final Function onPressed;
  const ForgotPasswordButton({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () => onPressed(loginEmail),
        padding: EdgeInsets.only(right: 0.0),
        child: Text(
          'Forgot Password?',
          style: kLabelStyle,
        ),
      ),
    );
  }
}
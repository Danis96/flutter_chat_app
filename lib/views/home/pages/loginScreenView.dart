import 'package:c/viewModels/loginScreenViewModel.dart';
import 'package:c/views/home/widgets/emailTextField.dart';
import 'package:c/views/home/widgets/forgotPasswordButton.dart';
import 'package:c/views/home/widgets/loginButton.dart';
import 'package:c/views/home/widgets/passwordTextField.dart';
import 'package:c/views/home/widgets/signupTextButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreenView extends StatefulWidget {
  @override
  _LoginScreenViewState createState() => _LoginScreenViewState();
}

class _LoginScreenViewState extends State<LoginScreenView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(143, 198, 65, 1.0),
                      Color.fromRGBO(139, 196, 59, 1.0),
                      Color.fromRGBO(136, 194, 52, 1.0),
                      Color.fromRGBO(132, 192, 46, 1.0),
                    ],
                    stops: [0.1, 0.4, 0.7, 0.9],
                  ),
                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 120.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Sign In',
                        style: TextStyle(
                          color: Color.fromRGBO(28, 28, 28, 1.0),
                          fontFamily: 'OpenSans',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 30.0),
                      EmailTextField(signup: false),
                      SizedBox(
                        height: 30.0,
                      ),
                      PasswordTextField(signup: false),
                      ForgotPasswordButton(onPressed: LoginScreenViewModel().forgotPassword),
                      LoginButton(onPressed: LoginScreenViewModel().loginUser),
                      SignupTextButton(onPressed: LoginScreenViewModel().signupOnSignin),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

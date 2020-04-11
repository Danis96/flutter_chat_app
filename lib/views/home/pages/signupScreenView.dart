import 'package:c/utils/globals.dart';
import 'package:c/viewModels/signupScreenViewModel.dart';
import 'package:c/views/home/widgets/emailTextField.dart';
import 'package:c/views/home/widgets/nameTextField.dart';
import 'package:c/views/home/widgets/passwordTextField.dart';
import 'package:c/views/home/widgets/signupButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignupScreenView extends StatefulWidget {
  @override
  _SignupScreenViewState createState() => _SignupScreenViewState();
}

class _SignupScreenViewState extends State<SignupScreenView> {
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
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 120.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Color.fromRGBO(28, 28, 28, 1.0),
                          fontFamily: 'OpenSans',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 30.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Align(
                            alignment: Alignment.center,
                            child: CircleAvatar(
                              radius: 100,
                              backgroundColor: Color.fromRGBO(28, 28, 28, 1.0),
                              child: ClipOval(
                                child: SizedBox(
                                  width: 180,
                                  height: 180,
                                  child: image != null
                                      ? Image.file(image, fit: BoxFit.fill)
                                      : Image.network(
                                          'https://i0.pngocean.com/files/798/436/28/computer-icons-user-profile-avatar-profile.jpg',
                                          fit: BoxFit.fill,
                                        ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 150.0),
                            child: IconButton(
                                icon: Icon(
                                  Icons.camera_alt,
                                  size: 30.0,
                                  color: Color.fromRGBO(28, 28, 28, 1.0),
                                ),
                                onPressed: () {
                                  SignupScreenViewModel().getImageFromGallery();
                                }),
                          ),
                        ],
                      ),
                      SizedBox(height: 30.0),
                      NameTextField(),
                      SizedBox(
                        height: 30.0,
                      ),
                      EmailTextField(signup: true),
                      SizedBox(
                        height: 30.0,
                      ),
                      PasswordTextField(signup: true),
                      SizedBox(
                        height: 15.0,
                      ),
                      SignupButton(
                          onPressed: SignupScreenViewModel().registerUser),
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

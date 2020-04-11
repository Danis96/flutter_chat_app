import 'package:c/viewModels/homeScreenViewModel.dart';
import 'package:c/views/home/widgets/loginButton.dart';
import 'package:c/views/home/widgets/signupButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreenView extends StatefulWidget {
  @override
  _HomeScreenViewState createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
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
                      SizedBox(
                        height: 50,
                      ),
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: 'Tech',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'OpenSans',
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                              )),
                          TextSpan(
                              text: 'Chat',
                              style: TextStyle(
                                color: Color.fromRGBO(28, 28, 28, 1.0),
                                fontFamily: 'OpenSans',
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                              )),
                        ]),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(60.0),
                        child: Image(
                            height: 100,
                            width: 100,
                            image: AssetImage('assets/img/tech387logo.png')),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      LoginButton(
                          onPressed: HomeScreenViewModel().loginOnHomeScreen),
                      SignupButton(
                          onPressed: HomeScreenViewModel().signupOnHomeScreen),
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

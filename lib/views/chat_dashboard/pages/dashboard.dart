import 'package:c/utils/size_config.dart';
import 'package:c/views/chat_dashboard/widgets/titleBelowAppBar.dart';
import 'package:flutter/material.dart';
import 'package:c/views/chat_dashboard/widgets/appBar.dart';
import 'package:c/views/chat_dashboard/widgets/friendsActive.dart';
import 'package:c/views/chat_dashboard/widgets/chatList.dart';
import 'package:firebase_auth/firebase_auth.dart';


class ChatDashboard extends StatelessWidget {
  final FirebaseUser activeUser;
  ChatDashboard(this.activeUser);
  @override
  Widget build(BuildContext context) {
    /// responsive
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Color.fromRGBO(132, 192, 46, 1.0),
      appBar: appBarCont(),
      body: Column(
        children: <Widget>[
          TitleBelowAppBar(),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(28, 28, 28, 1.0),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: Column(
                children: <Widget>[
                  FriendsActive(activeUser),
                  chatList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

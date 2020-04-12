import 'package:c/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:c/views/chat_dashboard/widgets/addFriendIcon.dart';

Widget appBarCont() {
  return AppBar(
    centerTitle: true,
    backgroundColor: Color.fromRGBO(132, 192, 46, 1.0),
    leading: SizedBox(
      height: 0.0,
      width: 0.0,
    ),
    title: Container(
      margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 4),
      child: Text(
        'Chats',
        style: TextStyle(
          color: Color.fromRGBO(28, 28, 28, 1.0),
          fontSize: SizeConfig.safeBlockHorizontal * 8,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        ),

      ),
    ),
    elevation: 0.0,
    actions: <Widget>[Container(margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 2), child: addFriendIcon())],
  );
}
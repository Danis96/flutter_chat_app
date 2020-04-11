import 'package:c/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:c/views/chat_dashboard/widgets/addFriendIcon.dart';

Widget appBarCont() { 
  return Container(
    padding: EdgeInsets.all(20),
    height: SizeConfig.blockSizeVertical * 15,
    decoration: BoxDecoration(shape: BoxShape.rectangle, color: Colors.white),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(right: SizeConfig.blockSizeHorizontal * 55),
          child: Text(
            'Chats',
            style: TextStyle(
                color: Colors.black,
                fontSize: SizeConfig.safeBlockHorizontal * 7,
                fontWeight: FontWeight.w500),
          ),
        ),
        /// add friend icon
        addFriendIcon(),
      ],
    ),
  );

}
import 'package:flutter/material.dart';
import 'package:c/views/chat_dashboard/widgets/userImg.dart';
import 'package:c/views/chat_dashboard/widgets/msgPart.dart';
import 'package:c/views/chat_dashboard/widgets/timeSend.dart';

Widget chatContainer() {
  /// chat container
  return Container(
    margin: EdgeInsets.only(top: 5.0, bottom: 5.0, right: 20.0),
    padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(20.0),
        bottomRight: Radius.circular(20.0),
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            userImg(),
            SizedBox(width: 10.0),
            msgPart(),
            SizedBox(width: 5.0),
            timeSend()
          ],
        )
      ],
    ),
  );
}

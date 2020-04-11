import 'package:flutter/material.dart';
import 'package:c/views/chat_dashboard/widgets/userImg.dart';
import 'package:c/views/chat_dashboard/widgets/msgPart.dart';
import 'package:c/views/chat_dashboard/widgets/timeSend.dart';

Widget chatContainer() {
  /// chat container
  return Container(
    decoration: BoxDecoration(
      border: Border(bottom: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.3))),
    ),
    child: Row(
      children: <Widget>[
        userImg(),
        msgPart(),
        timeSend(),
      ],
    ),
  );
}





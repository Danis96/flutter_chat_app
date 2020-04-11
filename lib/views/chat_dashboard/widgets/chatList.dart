import 'package:flutter/material.dart';
import 'package:c/views/chat_dashboard/widgets/chatContainer.dart';

Widget chatList() {
  return Expanded(
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: ListView.builder(
          itemCount: 12,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return chatContainer();
          },
        ),
      ),
    ),
  );
}

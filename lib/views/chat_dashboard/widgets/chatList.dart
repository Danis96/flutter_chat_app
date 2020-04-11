
import 'package:c/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:c/views/chat_dashboard/widgets/chatContainer.dart';

Widget chatList() {
  return Container(
    margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 2),
    child: ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: 12,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return chatContainer();
      },
    ),
  );
}
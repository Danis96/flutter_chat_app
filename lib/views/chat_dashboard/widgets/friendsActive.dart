import 'package:c/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:c/views/chat_dashboard/widgets/friendsContainer.dart';

Widget friendsActive() {
  return Container(
    padding: EdgeInsets.all(5),
    margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 2),
    height: SizeConfig.blockSizeVertical * 8,
    child: ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return friendContainer();
      },
    ),
  );
}



import 'package:c/utils/size_config.dart';
import 'package:flutter/material.dart';

Widget addFriendIcon() {
  return Container(
    child: IconButton(
      icon: Icon(Icons.group_add),
      onPressed: null,
      iconSize: SizeConfig.blockSizeHorizontal * 8,
    ),
  );
}

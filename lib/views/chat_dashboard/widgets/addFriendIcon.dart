import 'package:c/utils/size_config.dart';
import 'package:flutter/material.dart';

Widget addFriendIcon() {
  return IconButton(
    icon: Icon(Icons.group_add),
    color: Color.fromRGBO(28, 28, 28, 1.0),
    onPressed: () {},
    iconSize: SizeConfig.blockSizeHorizontal * 8,
  );
}

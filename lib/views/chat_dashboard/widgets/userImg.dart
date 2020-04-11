import 'package:c/utils/size_config.dart';
import 'package:flutter/material.dart';

Widget userImg() {
  /// image Container
  return Container(
      margin: EdgeInsets.only(
          right: SizeConfig.blockSizeHorizontal * 5,
          left: SizeConfig.blockSizeHorizontal * 3),
      width: 60,
      height: 60,
      child: CircleAvatar(
        backgroundImage: AssetImage('assets/img/cat.jpg'),
        radius: 100,
      ));
}
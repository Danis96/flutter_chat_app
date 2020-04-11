import 'package:c/utils/size_config.dart';
import 'package:flutter/material.dart';

Widget friendContainer() {
  return Container(
      margin: EdgeInsets.only(right: SizeConfig.blockSizeHorizontal * 5),
      width: 60.0,
      decoration: new BoxDecoration(
          shape: BoxShape.circle,
          image: new DecorationImage(
              fit: BoxFit.fill,
              image: new NetworkImage(
                  "https://greendestinations.org/wp-content/uploads/2019/05/avatar-exemple.jpg"))));
}
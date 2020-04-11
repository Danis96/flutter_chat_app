
import 'package:c/utils/size_config.dart';
import 'package:flutter/material.dart';

Widget timeSend() {
  return Container(
    margin: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 12),
    child: Text(
      '15:30',
      style: TextStyle(color: Colors.grey),
    ),
  );
}

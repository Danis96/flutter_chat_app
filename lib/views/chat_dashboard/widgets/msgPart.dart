import 'package:c/utils/size_config.dart';
import 'package:flutter/material.dart';

Widget msgPart() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      Container(
        width: SizeConfig.blockSizeHorizontal * 50,
        child: Text('Username', style: TextStyle(fontWeight: FontWeight.w500)),
      ),
      Container(
        padding: EdgeInsets.only(bottom: SizeConfig.blockSizeVertical * 2),
        margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 1.2),
        width: SizeConfig.blockSizeHorizontal * 50,
        child: Text(
          'Hey, answer me when you get this message, it is important.',
          maxLines: 2,
        ),
      ),
    ],
  );
}
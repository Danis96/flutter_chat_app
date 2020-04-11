import 'package:c/utils/size_config.dart';
import 'package:flutter/material.dart';

Widget msgPart() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'Username',
        style: TextStyle(
          color: Colors.grey,
          fontSize: 15.0,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.start,
      ),
      SizedBox(height: 5.0),
      Container(
        width: SizeConfig.blockSizeHorizontal * 50,
        child: Text(
          'Hey, answer me when you get this message, it is important.',
          style: TextStyle(
            color: Colors.blueGrey,
            fontSize: 15.0,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.start,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
      ),
    ],
  );
}

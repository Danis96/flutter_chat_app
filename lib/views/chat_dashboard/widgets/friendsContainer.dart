import 'package:flutter/material.dart';

Widget friendContainer() {
  return Padding(
      padding: EdgeInsets.all(10.0),
      child: CircleAvatar(
        radius: 28.0,
        backgroundImage: NetworkImage(
            "https://greendestinations.org/wp-content/uploads/2019/05/avatar-exemple.jpg"),
      ));
}

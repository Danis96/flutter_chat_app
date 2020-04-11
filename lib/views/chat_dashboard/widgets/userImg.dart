import 'package:c/utils/globals.dart';
import 'package:flutter/material.dart';

Widget userImg() {
  /// image Container
  return CircleAvatar(
    radius: 28.0,
    backgroundImage: NetworkImage(imageURL),
  );
}

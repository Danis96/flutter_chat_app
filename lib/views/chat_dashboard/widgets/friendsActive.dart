import 'package:flutter/material.dart';
import 'package:c/views/chat_dashboard/widgets/friendsContainer.dart';

Widget friendsActive() {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 10.0),
    child: Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Contacts',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.more_horiz,
                ),
                iconSize: 30.0,
                color: Colors.white,
                onPressed: () {},
              ),
            ],
          ),
        ),
        Container(
          height: 80,
          child: ListView.builder(
            padding: EdgeInsets.only(left: 10.0),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return friendContainer();
            },
          ),
        )
      ],
    ),
  );
}
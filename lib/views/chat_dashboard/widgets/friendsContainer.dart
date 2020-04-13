
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:c/viewModels/chatDashboardViewModel.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';



class FriendContainer extends StatelessWidget {
  final String name, image, email;
  final DocumentSnapshot doc;
  final FirebaseUser userActive;
  FriendContainer({this.name, this.image, this.doc, this.userActive, this.email});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
          child: GestureDetector(
            onTap: () =>  ChatDashboardViewModel().navigateTo(context, name, userActive, email) ,
                      child: Container(
              padding: EdgeInsets.all(10),
              child: CircleAvatar(
                radius: 28.0,
                backgroundImage: NetworkImage(
                  image != null
                    ? image
                    : 'https://greendestinations.org/wp-content/uploads/2019/05/avatar-exemple.jpg'),
              ),
            ),
          ),
        ),
        Container(child: Center(child: Text(name, style: TextStyle(color: Colors.white),)))
      ],
    );
  }
}

import 'package:c/models/userModel.dart';
import 'package:c/utils/size_config.dart';
import 'package:c/viewModels/chatDashboardViewModel.dart';
import 'package:c/views/chat_dashboard/widgets/emptyContainer.dart';
import 'package:flutter/material.dart';
import 'package:c/views/chat_dashboard/widgets/friendsContainer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FriendsActive extends StatelessWidget {
  List<dynamic> _users = [];
  String _name, _email, _image, _password, _userID;
  DocumentSnapshot doc;

  final FirebaseUser userActive;
  FriendsActive(this.userActive);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: <Widget>[
          FutureBuilder(
              future: ChatDashboardViewModel().getFriends(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  _users = snapshot.data
                      .map((doc) => User.fromDocument(doc))
                      .toList();
                  return Container(
                    height: SizeConfig.blockSizeVertical * 12,
                    child: ListView.builder(
                      padding: EdgeInsets.only(left: 10.0),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: _users.length,
                      itemBuilder: (BuildContext context, int index) {
                        doc = snapshot.data[index];

                        _name = _users[index].name;
                        _email = _users[index].email;
                        _password = _users[index].password;
                        _image = _users[index].image;
                        _userID = _users[index].userID;

                        if (userActive.email != _email) {
                          return FriendContainer(
                              name: _name,
                              image: _image,
                              email: _email,
                              doc: doc,
                              userActive: userActive);
                        } else {
                          return EmptyContainer();
                        }
                      },
                    ),
                  );
                }
                return EmptyContainer();
              })
        ],
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  
  final String name, email, image, password, userID;
  final List<dynamic> chats;

  User({this.email, this.image, this.name, this.password, this.userID, this.chats});

  factory User.fromDocument(DocumentSnapshot doc) {
    return User(
      name: doc['name'],
      email: doc['email'],
      image: doc['image'],
      password: doc['password'],
      userID: doc['user_id'],
    );
  }
}

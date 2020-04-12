import 'package:c/viewModels/chatDashboardViewModel.dart';
import 'package:c/viewModels/chatViewModel.dart';
import 'package:c/views/chat_room/widgets/message.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Chat extends StatefulWidget {
  /// ti  - user koji si ti
  final FirebaseUser user;
  /// user s kojim chatas
  final String withChat;

  const Chat({Key key, this.user, this.withChat}) : super(key: key);
  @override
  _ChatState createState() => _ChatState(withChat: withChat);
}

class _ChatState extends State<Chat> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Firestore _firestore = Firestore.instance;
  final String withChat;

  _ChatState({this.withChat});

  List<DocumentSnapshot> docs;
  List<Widget> messages;

  TextEditingController messageController = TextEditingController();
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: FutureBuilder(
                future: ChatDashboardViewModel().getFriends(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData)
                    return Center(
                      child: CircularProgressIndicator(),
                    );

                  docs = snapshot.data;

                  return ListView.builder(
                    itemCount: docs.length,
                    controller: scrollController,
                    itemBuilder: (BuildContext context, int index) {
                      return Message(
                        from: docs[index].data['name'],
                        msgs: docs[index].data['chat$withChat'],
                        me: widget.user.email == docs[index].data['name'],
                        text: 'sss',
                      );
                    },
                  );
                },
              ),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onSubmitted: (value) => ChatViewModel().sendMsg(
                          messageController,
                          widget.user.email,
                          withChat,
                          widget.user,
                          scrollController),
                      decoration: InputDecoration(
                        hintText: "Enter a Message...",
                        border: const OutlineInputBorder(),
                      ),
                      controller: messageController,
                    ),
                  ),
                  RaisedButton(
                    onPressed: () => ChatViewModel().sendMsg(
                        messageController,
                        widget.user.email,
                        withChat,
                        widget.user,
                        scrollController),
                    child: Text('Send'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

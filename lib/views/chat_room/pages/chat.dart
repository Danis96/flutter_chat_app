import 'package:c/models/messageModel.dart';
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
  final String email;

  Chat({Key key, this.user, this.withChat, this.email}) : super(key: key);
  @override
  _ChatState createState() => _ChatState(withChat: withChat);
}

class _ChatState extends State<Chat> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Firestore _firestore = Firestore.instance;
  final String withChat;

  _ChatState({this.withChat});

  TextEditingController messageController = TextEditingController();
  ScrollController scrollController = ScrollController();
  List<dynamic> _msgs = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: FutureBuilder(
                future: ChatViewModel().getMessages(widget.email, widget.user),
                builder: (context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData)
                    return Center(
                      child: CircularProgressIndicator(),
                    );

                  _msgs = snapshot.data
                      .map((doc) => MessageChat.fromDocument(doc))
                      .toList();

                  return ListView.builder(
                    itemCount: _msgs.length,
                    controller: scrollController,
                    itemBuilder: (BuildContext context, int index) {
                      return Message(
                        from: _msgs[index].sender,
                        me: widget.user.email == _msgs[index].sender,
                        text: _msgs[index].content,
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
                        scrollController,
                      ),
                      decoration: InputDecoration(
                        hintText: "Enter a Message...",
                        border: const OutlineInputBorder(),
                      ),
                      controller: messageController,
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {
                      setState(() {});
                      ChatViewModel().sendMsg(
                        messageController,
                        widget.email,
                        withChat,
                        widget.user,
                        scrollController,
                      );
                    },
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

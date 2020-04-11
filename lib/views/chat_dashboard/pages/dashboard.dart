import 'package:c/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:c/views/chat_dashboard/widgets/appBar.dart';
import 'package:c/views/chat_dashboard/widgets/friendsActive.dart';
import 'package:c/views/chat_dashboard/widgets/chatList.dart';

class ChatDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// responsive
    SizeConfig().init(context);
    return Scaffold(
      body: ListView(shrinkWrap: true, children: <Widget>[
        appBarCont() ,
        Container(
          height: SizeConfig.blockSizeVertical * 80,
          child: CustomScrollView(
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    friendsActive(),
                    chatList(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}





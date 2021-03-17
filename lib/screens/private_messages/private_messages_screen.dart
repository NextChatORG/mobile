import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nextchat/core/messages/message.dart';
import 'package:nextchat/screens/private_messages/components/text_message_component.dart';

class PrivateMessagesScreen extends StatelessWidget {
  final String avatar;
  final String username;
  final String lastOnline;
  final List<Message> messages;

  PrivateMessagesScreen({
    Key key,
    @required this.avatar,
    @required this.username,
    @required this.lastOnline,
    this.messages = const [],
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController _messagesController = ScrollController();

    List<List<Message>> messages = [];

    List<Message> collector = [];
    MessageFrom current;
    for (Message message in this.messages) {
      if (current == null) {
        current = message.from;
      }

      if (current != message.from) {
        messages.add(collector.toList());

        collector.clear();
        current = message.from;
      }

      collector.add(message);
    }

    if (collector.length > 0) {
      messages.add(collector.toList());

      collector.clear();
      current = null;
    }
    
    Timer(
      Duration(seconds: 1),
          () => _messagesController.jumpTo(_messagesController.position.maxScrollExtent),
    );

    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              // Header
              Container(
                padding: EdgeInsets.only(top: 4.0, bottom: 4.0, right: 8.0),
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey[200])),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      iconSize: 34.0,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      padding: EdgeInsets.all(0),
                      icon: Icon(Icons.chevron_left_rounded, color: Colors.indigo,),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(23.0)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.indigo.withAlpha(80),
                            spreadRadius: 1.0,
                            blurRadius: 2.0,
                          ),
                        ],
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Image.asset(avatar, width: 35, height: 35),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            username,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16.0,
                            ),
                          ),
                          Text(
                            lastOnline,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 10.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Messages
              Expanded(
                child: ListView(
                  controller: _messagesController,
                  children: messages.map((messages) {
                    return TextMessageComponent(
                      position: (messages[0].from == MessageFrom.Other) ? TextMessagePosition.Left : TextMessagePosition.Right,
                      messages: messages.toList(),
                    );
                  }).toList(),
                ),
              ),

              // Text input
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                padding: EdgeInsets.only(left: 16.0, right: 2.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(35.0)),
                  boxShadow: [
                    BoxShadow(color: Colors.grey, spreadRadius: 1.0),
                  ],
                ),
                clipBehavior: Clip.antiAlias,
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                          border: OutlineInputBorder(borderSide: BorderSide.none),
                          hintText: "Text here...",
                        ),
                        onSubmitted: (text) {
                          print('Input Chat: $text');
                        },
                      ),
                    ),
                    IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      padding: EdgeInsets.all(0),
                      color: Colors.indigo,
                      icon: Icon(Icons.send_rounded),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

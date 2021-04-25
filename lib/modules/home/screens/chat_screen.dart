import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nextchat/core/models/message_model.dart';
import 'package:nextchat/core/settings/apllication_settings.dart';
import 'package:nextchat/modules/home/repositories/chat_repository.dart';

class ChatScreen extends StatefulWidget {
  final String username;

  ChatScreen(this.username);

  @override
  _ChatScreenState createState() => _ChatScreenState(this.username);
}

class _ChatScreenState extends State<ChatScreen> {
  final String username;
  List<MessageModel> messages;

  GlobalKey _viewMoreKey;

  ScrollController _scrollController;
  TextEditingController _messageController;

  _ChatScreenState(this.username) {
    this._viewMoreKey = GlobalKey();

    this._scrollController = ScrollController();
    this._messageController = TextEditingController();

    this.messages = ChatRepository.getMessages();
  }

  Widget _buildMessages(List<MessageModel> messages) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: (messages[0].isFromOther())
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.end,
        children: messages.map((message) {
          int index = messages.indexOf(message);
          return message.toWidget(
            margin: EdgeInsets.only(
              top: (index > 0) ? 4 : 0,
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildMoreActionsMenu() {
    return PopupMenuButton(
      key: this._viewMoreKey,
      onSelected: (value) => print("Menu selection: $value"),
      itemBuilder: (_) => [
        PopupMenuItem(
          value: 'block',
          child: Text('Bloquear'),
        ),
        PopupMenuItem(
          value: 'clear_messages',
          child: Text('Vaciar chat'),
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return AppBar(
      leading: IconButton(
        onPressed: () => ApplicationSettings.router.pop(context),
        icon: Icon(Icons.arrow_back_ios_rounded),
      ),
      title: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {},
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(23.0)),
              ),
              clipBehavior: Clip.antiAlias,
              child: Image.asset(
                'assets/images/fake_faces/friend_6.jpg',
                width: 35,
                height: 35,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Diana',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                    'Última conexión recientemente',
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 10.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      actions: [
        this._buildMoreActionsMenu(),
      ],
    );
  }

  List<List<MessageModel>> _buildMessagesModel() {
    List<List<MessageModel>> messages = [];

    List<MessageModel> collector = [];
    MessageFrom current;

    for (MessageModel message in this.messages) {
      if (current == null) {
        current = message.getFrom();
      }

      if (current != message.getFrom()) {
        messages.add(collector.toList());
        collector.clear();
        current = message.getFrom();
      }

      collector.add(message);
    }

    if (collector.length > 0) {
      messages.add(collector.toList());
      collector.clear();
      current = null;
    }

    return messages;
  }

  Container _buildBottomBar(BuildContext context, double width) {
    return Container(
      width: width,
      margin: EdgeInsets.all(12.0),
      padding: EdgeInsets.only(
        left: 12.0,
        top: 2.0,
        right: 2.0,
        bottom: 2.0,
      ),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).accentColor.withAlpha(100),
            blurRadius: 1,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: this._messageController,
              onSubmitted: (_) {},
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Escribe aquí...',
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            icon: Icon(
              Icons.send,
              color: Theme.of(context).accentColor,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetMessages = this._buildMessagesModel().map((e) => this._buildMessages(e.toList())).toList();

    return Scaffold(
      appBar: this._buildHeader(),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            Timer(Duration(milliseconds: 200), () => this._scrollController.animateTo(
              this._scrollController.position.maxScrollExtent,
              duration: Duration(milliseconds: 500),
              curve: Curves.ease,
            ));

            return Container(
              height: constraints.maxHeight,
              child: Stack(
                children: [
                  Container(
                    width: constraints.maxWidth,
                    height: constraints.maxHeight - 70,
                    child: SingleChildScrollView(
                      controller: this._scrollController,
                      child: Column(
                        children: widgetMessages,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    bottom: 0,
                    child: this._buildBottomBar(
                      context,
                      constraints.maxWidth - 24,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

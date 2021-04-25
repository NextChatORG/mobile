import 'package:flutter/material.dart';
import 'package:nextchat/core/models/message_preview_model.dart';

enum MessagePreviewType {
  Home,
  Chats,
}

class MessagePreviewWidgetModel extends StatelessWidget {
  final MessagePreviewType messageType;
  final MessagePreviewModel message;
  final void Function() onPressed;

  MessagePreviewWidgetModel(this.messageType, this.message, {
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    Color splashColor = Colors.indigo[(this.message.getMessagesCount() > 0) ? 100 : 50];
    EdgeInsetsGeometry margin = EdgeInsets.all(0.0);

    EdgeInsetsGeometry padding = EdgeInsets.symmetric(
      vertical: 8.0,
      horizontal: 16.0,
    );

    BoxDecoration decoration = BoxDecoration(
      color: (this.message.getMessagesCount() > 0) ? Colors.indigo[50] : Colors.transparent,
      border: Border(
        top: BorderSide(
          color: Colors.grey[200],
        ),
      ),
    );

    if (this.messageType == MessagePreviewType.Home) {
      splashColor = Colors.indigo[50];

      margin = EdgeInsets.only(
        top: 8.0,
      );

      padding = EdgeInsets.only(
        top: 8.0,
        bottom: 8.0,
        left: 8.0,
        right: 16.0,
      );

      decoration = BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      );
    }

    return Container(
      margin: margin,
      decoration: decoration,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: splashColor,
          highlightColor: Colors.transparent,
          onTap: this.onPressed,
          child: Container(
            padding: padding,
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    right: (this.messageType == MessagePreviewType.Home) ? 8.0 : 16.0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: this.message.getAvatarWidget((this.messageType == MessagePreviewType.Home) ? 45 : 55),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                this.message.getUsername(),
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              (this.message.getMessagesCount() > 1) ? Container(
                                margin: EdgeInsets.only(left: 4.0),
                                width: 15,
                                height: 15,
                                decoration: BoxDecoration(
                                  color: Colors.indigo,
                                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                ),
                                clipBehavior: Clip.antiAlias,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    (this.message.getMessagesCount() > 9) ? '+9' : this.message.getMessagesCount().toString(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ) : Container(),
                            ],
                          ),
                          Text(
                            this.message.getDate(),
                            style: TextStyle(
                              color: Colors.indigo[300],
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: 1.5,
                        ),
                        child: Text(
                          this.message.getLastMessage(),
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

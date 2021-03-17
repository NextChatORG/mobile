import 'package:flutter/material.dart';

class MessagePreviewComponent extends StatelessWidget {
  final String avatar;
  final String username;
  final int unreadMessagesCount;
  final String date;
  final String lastMessage;

  final void Function() onClick;

  MessagePreviewComponent({
    Key key,
    @required this.avatar,
    @required this.username,
    @required this.unreadMessagesCount,
    @required this.date,
    @required this.lastMessage,
    @required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: (unreadMessagesCount > 0) ? Colors.indigo[50] : Colors.transparent,
        border: Border(top: BorderSide(color: Colors.grey[200])),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.indigo[(unreadMessagesCount > 0) ? 100 : 50],
          highlightColor: Colors.transparent,
          onTap: onClick,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 16.0),
                  decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30.0))),
                  clipBehavior: Clip.antiAlias,
                  child: Image.asset(avatar, width: 55, height: 55),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(username, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                              (unreadMessagesCount > 1) ? Container(
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
                                    (unreadMessagesCount > 9) ? "+9" : unreadMessagesCount.toString(),
                                    style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ) : Text(""),
                            ],
                          ),
                          Text(date, style: TextStyle(color: Colors.indigo[300], fontSize: 12)),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 1.5),
                        child: Text(lastMessage, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
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

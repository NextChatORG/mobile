import 'package:flutter/material.dart';

class UnreadMessagePreviewComponent extends StatelessWidget {
  final String avatar;
  final String username;
  final int messagesCount;
  final String date;
  final String lastMessage;

  UnreadMessagePreviewComponent({
    Key key,
    @required this.avatar,
    @required this.username,
    @required this.messagesCount,
    @required this.date,
    @required this.lastMessage,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8.0),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      clipBehavior: Clip.antiAlias,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.indigo[50],
          highlightColor: Colors.transparent,
          onTap: () {},
          child: Container(
            padding: EdgeInsets.only(top: 8.0, bottom: 8.0, left: 8.0, right: 16.0),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 8.0),
                  decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(23.0))),
                  clipBehavior: Clip.antiAlias,
                  child: Image.asset(avatar, width: 45, height: 45),
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
                              (messagesCount > 1) ? Container(
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
                                    (messagesCount > 9) ? "+9" : messagesCount.toString(),
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

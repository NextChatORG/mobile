import 'package:flutter/material.dart';
import 'package:nextchat/core/messages/message.dart';

enum TextMessagePosition {
  Left,
  Right,
}

class TextMessageComponent extends StatelessWidget {
  final TextMessagePosition position;
  final List<Message> messages;

  TextMessageComponent({
    Key key,
    this.position = TextMessagePosition.Left,
    @required this.messages,
  }) : super(key: key);

  Widget _buildMessage(BuildContext context, Message message, int index) {
    double maxWidth = MediaQuery.of(context).size.width * 0.75;
    double contentMaxWidth = maxWidth - 32.0;

    Color textColor = (position == TextMessagePosition.Left) ? Colors.indigo[200] : Colors.white70;
    TextStyle contentStyle = TextStyle(color: (position == TextMessagePosition.Left) ? Colors.black : Colors.white);
    TextStyle dateStyle = TextStyle(color: textColor,  fontSize: 10.0,  fontWeight: FontWeight.bold);

    TextSpan contentText = TextSpan(text: message.content, style: contentStyle);
    final richText = Text.rich(contentText).build(context) as RichText;
    final renderObject = richText.createRenderObject(context)..layout(
      BoxConstraints(
        minWidth: MediaQuery.of(context).size.width * 0.25,
        maxWidth: contentMaxWidth,
      ),
    );

    final boxes = renderObject.getBoxesForSelection(
      TextSelection(
        baseOffset: 0,
        extentOffset: contentText.toPlainText().characters.length,
      ),
    );

    Size dateSize = (TextPainter(
      text: TextSpan(text: message.date, style: dateStyle),
      textDirection: TextDirection.ltr,
    )..layout()).size;

    contentMaxWidth -= dateSize.width + 8.0;

    EdgeInsetsGeometry contentMargin = EdgeInsets.all(0.0);
    if (boxes.length == 1 && boxes.last.right < contentMaxWidth) {
      contentMargin = EdgeInsets.only(right: dateSize.width + 24.0);
    } else {
      contentMargin = EdgeInsets.only(
        bottom: (boxes.last.right < contentMaxWidth) ? 4.0 : 16.0,
      );
    }

    return Container(
      margin: EdgeInsets.only(top: (index > 0) ? 4 : 0),
      constraints: BoxConstraints(
        minWidth: MediaQuery.of(context).size.width * 0.25,
        maxWidth: maxWidth,
      ),
      decoration: BoxDecoration(
        color: (position == TextMessagePosition.Left) ? Colors.grey[200] : Colors.indigo,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          Container(
            margin: contentMargin,
            child: Text(message.content, style: contentStyle),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Row(
              children: [
                Text(message.date, style: dateStyle),
                Container(
                  margin: EdgeInsets.only(left: 2.0),
                  child: Icon(
                    (message.seen) ? Icons.done_all_rounded : Icons.done_rounded,
                    size: 12.0,
                    color: textColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment:
        (position == TextMessagePosition.Left)
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.end,
        children: messages.map((message) {
          int index = messages.indexOf(message);
          return _buildMessage(context, message, index);
        }).toList(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:nextchat/core/models/message_model.dart';

class MessageWidgetModel extends StatelessWidget {
  final MessageModel message;
  final void Function() onLongPress;

  final EdgeInsetsGeometry margin;

  MessageWidgetModel(this.message, {
    this.onLongPress,
    this.margin = const EdgeInsets.all(0.0),
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double maxWidth = screenWidth * 0.75;
    double minWidth = screenWidth * 0.25;

    double contentMaxWidth = maxWidth - 24.0;

    Color textColor = (this.message.isFromOther()) ? Colors.indigo[200] : Colors.white70;

    TextStyle contentStyle = TextStyle(
      color: (this.message.isFromOther()) ? Colors.black : Colors.white,
    );

    TextStyle dateStyle = TextStyle(
      color: textColor,
      fontSize: 10.0,
      fontWeight: FontWeight.bold,
    );

    TextSpan contentText = TextSpan(
      text: this.message.getContent(),
      style: contentStyle,
    );

    final richText = Text.rich(contentText).build(context) as RichText;
    final renderObject = richText.createRenderObject(context)..layout(
      BoxConstraints(
        minWidth: minWidth,
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
      text: TextSpan(
        text: this.message.getDate(),
        style: dateStyle,
      ),
      textDirection: TextDirection.ltr,
    )..layout()).size;

    contentMaxWidth -= dateSize.width + 8.0;

    EdgeInsetsGeometry contentMargin = EdgeInsets.all(0.0);
    if (boxes.length == 1 && boxes.last.right < contentMaxWidth) {
      contentMargin = EdgeInsets.only(
        right: dateSize.width + 12.0,
      );
    } else if (boxes.length > 1 || boxes.last.right > contentMaxWidth) {
      contentMargin = EdgeInsets.only(
        bottom: (boxes.last.right < contentMaxWidth) ? 4.0 : 14.0,
      );
    }

    return Container(
      margin: this.margin,
      constraints: BoxConstraints(
        minWidth: minWidth,
        maxWidth: maxWidth,
      ),
      decoration: BoxDecoration(
        color: (this.message.isFromOther()) ? Colors.grey[200] : Colors.indigo,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      padding: EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 12.0,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onLongPress: this.onLongPress,
          child: Stack(
            alignment: Alignment.topLeft,
            children: [
              Container(
                margin: contentMargin,
                child: Text(
                  this.message.getContent(),
                  style: contentStyle,
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Text(
                  this.message.getDate(),
                  style: dateStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

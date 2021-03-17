enum MessageFrom {
  Other,
  Me,
}

class Message {
  final MessageFrom from;
  final String content;
  final String date;

  final bool seen;

  Message({
    this.from,
    this.content,
    this.date,
    this.seen = false,
  });
}

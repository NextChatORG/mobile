import 'package:nextchat/database.dart';
import 'package:nextchat/models/user.dart';
import 'package:nextchat/settings.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketHelper {
  WebSocketHelper._privateConstructor();
  static final WebSocketHelper instance = WebSocketHelper._privateConstructor();

  static final DatabaseHelper _database = DatabaseHelper.instance;
  static WebSocketChannel _channel;

  Future<WebSocketChannel> get channel async {
    if (_channel == null) {
      UserAccount me = await _database.getCurrentAccount();
      String userID = me.id;
      _channel =
          IOWebSocketChannel.connect('ws://$API_URL/ws/?user_id=$userID');
    }

    return _channel;
  }

  void close() {
    if (_channel != null) _channel.sink.close();
    _channel = null;
  }
}

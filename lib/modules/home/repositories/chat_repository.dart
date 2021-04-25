import 'package:nextchat/core/models/message_model.dart';

class ChatRepository {
  static List<MessageModel> getMessages() {
    DateTime now = DateTime.now();

    return [
      MessageModel(
        content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dolor ornare dui blandit aliquam, commodo egestas vestibulum.',
        date: now,
        seen: true,
      ),
      MessageModel(
        from: MessageFrom.Other,
        content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dolor ornare dui blandit aliquam, commodo egestas vestibulum.',
        date: now,
        seen: true,
      ),
      MessageModel(
        content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dolor ornare dui blandit aliquam, commodo egestas vestibulum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dolor ornare dui blandit aliquam, commodo egestas vestibulum.',
        date: now,
        seen: true,
      ),
      MessageModel(
        content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dolor ornare dui blandit aliquam, commodo egestas vestibulum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dolor ornare dui blandit aliquam, commodo egestas vestibulum.',
        date: now,
        seen: true,
      ),
      MessageModel(
        from: MessageFrom.Other,
        content: 'ornare dui blandit aliquam, commodo',
        date: now,
        seen: true,
      ),
      MessageModel(
        from: MessageFrom.Other,
        content: '¡Hola!',
        date: now,
        seen: true,
      ),
      MessageModel(
        from: MessageFrom.Other,
        content: 'Necesito verte mañana.',
        date: now,
        seen: true,
      ),
      MessageModel(
        from: MessageFrom.Other,
        content: '¿Puedes venir aquí?',
        date: now,
        seen: true,
      ),
      MessageModel(
        content: 'Está bien, nos vemos 👋🏻',
        date: now,
      ),
    ];
  }
}

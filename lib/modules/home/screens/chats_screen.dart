import 'package:flutter/material.dart';
import 'package:nextchat/config/routes/routes.dart';
import 'package:nextchat/core/models/message_preview_model.dart';
import 'package:nextchat/core/settings/apllication_settings.dart';
import 'package:nextchat/modules/home/models/layout_home_view_model.dart';

class ChatsScreen extends StatefulWidget {
  @override
  _ChatsScreenState createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();

    return LayoutHomeViewModel(
      childrenMargin: EdgeInsets.all(0.0),
      children: [
        MessagePreviewModel(
          avatar: 'assets/images/fake_faces/friend_6.jpg',
          username: 'Diana',
          messagesCount: 0,
          date: DateTime(now.year, now.month, now.day, now.hour, now.minute - 2),
          lastMessage: 'Tú: Está bien, nos vemos 👋🏻',
        ).toWidget(
          onPressed: () => ApplicationSettings.router.navigateTo(
            context,
            "${Routes.chat}/diana",
          ),
        ),
        MessagePreviewModel(
          avatar: 'assets/images/fake_faces/friend_1.jpg',
          username: 'Samantha',
          messagesCount: 1,
          date: DateTime(now.year, now.month, now.day, now.hour, now.minute - 10),
          lastMessage: '¡Hola!',
        ).toWidget(onPressed: () {}),
        MessagePreviewModel(
          avatar: 'assets/images/fake_faces/friend_2.jpg',
          username: 'Josue',
          messagesCount: 10,
          date: DateTime(now.year, now.month, now.day, now.hour - 1),
          lastMessage: 'Te lo enviaré mañana.',
        ).toWidget(onPressed: () {}),
        MessagePreviewModel(
          avatar: 'assets/images/fake_faces/friend_7.jpg',
          username: 'Valen',
          messagesCount: 0,
          date: DateTime(now.year, now.month, now.day, 00, 15),
          lastMessage: '¡Buenas noches! 🌚',
        ).toWidget(onPressed: () {}),
        MessagePreviewModel(
          avatar: 'assets/images/fake_faces/friend_8.jpg',
          username: 'Arturo',
          messagesCount: 0,
          date: DateTime(now.year, now.month, now.day - 1),
          lastMessage: 'He terminado de reparar tu computadora 🤑',
        ).toWidget(onPressed: () {}),
        MessagePreviewModel(
          avatar: 'assets/images/fake_faces/friend_3.jpg',
          username: 'Diego',
          messagesCount: 2,
          date: DateTime(now.year, now.month, now.day - 1),
          lastMessage: '¿Cómo estás?',
        ).toWidget(onPressed: () {}),
        MessagePreviewModel(
          avatar: 'assets/images/fake_faces/friend_4.jpg',
          username: 'Alex',
          messagesCount: 5,
          date: DateTime(now.year, 1, 15),
          lastMessage: 'Estoy esperando tu respuesta...',
        ).toWidget(onPressed: () {}),
        MessagePreviewModel(
          avatar: 'assets/images/fake_faces/friend_9.jpg',
          username: 'Joaquín Gómez',
          messagesCount: 0,
          date: DateTime(now.year, 1, 2),
          lastMessage: 'Tú: ¡Está bien! 😎',
        ).toWidget(onPressed: () {}),
        MessagePreviewModel(
          avatar: 'assets/images/fake_faces/friend_5.jpg',
          username: 'Amanda',
          messagesCount: 1,
          date: DateTime(now.year - 1, 12, 31),
          lastMessage: '¡Feliz año nuevo!',
        ).toWidget(onPressed: () {}),
      ],
    );
  }
}

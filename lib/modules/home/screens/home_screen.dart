import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:nextchat/config/routes/routes.dart';
import 'package:nextchat/core/models/message_preview_model.dart';
import 'package:nextchat/core/settings/apllication_settings.dart';
import 'package:nextchat/modules/home/models/layout_home_view_model.dart';
import 'package:nextchat/modules/home/models/message_preview_widget_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _buildTitle(String title, {
    EdgeInsetsGeometry margin = const EdgeInsets.symmetric(vertical: 8.0),
  }) {
    return Container(
      margin: margin,
      child: Text(
        title,
        style: TextStyle(
          color: Colors.grey[400],
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }

  Widget _buildNewPreview({
    String image,
    String title,
    String date,
    String description,
  }) {
    return Card(
      child: InkWell(
        splashColor: Colors.indigo.withAlpha(40),
        onTap: () {},
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Image.network(
                    image,
                    width: 40,
                    height: 40,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 8.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: 1.0,
                          ),
                          child: Text(
                            date,
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 8.0,
                ),
                child: Text(
                  description,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();

    return LayoutHomeViewModel(
      children: [
        this._buildTitle(
          'Mensajes no leídos',
          margin: EdgeInsets.only(
            bottom: 8.0,
          ),
        ),
        MessagePreviewModel(
          avatar: 'assets/images/fake_faces/friend_1.jpg',
          username: 'Samantha',
          messagesCount: 1,
          date: DateTime(now.year, now.month, now.day, now.hour, now.minute - 10),
          lastMessage: '¡Hola!',
        ).toWidget(
          type: MessagePreviewType.Home,
          onPressed: () {},
        ),
        MessagePreviewModel(
          avatar: 'assets/images/fake_faces/friend_2.jpg',
          username: 'Josue',
          messagesCount: 10,
          date: DateTime(now.year, now.month, now.day, now.hour - 1),
          lastMessage: 'Te lo enviaré mañana.',
        ).toWidget(
          type: MessagePreviewType.Home,
          onPressed: () {},
        ),
        MessagePreviewModel(
          avatar: 'assets/images/fake_faces/friend_3.jpg',
          username: 'Diego',
          messagesCount: 2,
          date: DateTime(now.year, now.month, now.day - 1),
          lastMessage: '¿Cómo estás?',
        ).toWidget(
          type: MessagePreviewType.Home,
          onPressed: () {},
        ),
        MessagePreviewModel(
          avatar: 'assets/images/fake_faces/friend_4.jpg',
          username: 'Alex',
          messagesCount: 5,
          date: DateTime(now.year, 1, 15),
          lastMessage: 'Estoy esperando tu respuesta...',
        ).toWidget(
          type: MessagePreviewType.Home,
          onPressed: () {},
        ),
        MessagePreviewModel(
          avatar: 'assets/images/fake_faces/friend_5.jpg',
          username: 'Amanda',
          messagesCount: 1,
          date: DateTime(now.year - 1, 12, 31),
          lastMessage: '¡Feliz año nuevo!',
        ).toWidget(
          type: MessagePreviewType.Home,
          onPressed: () {},
        ),
        Container(
          width: double.infinity,
          child: TextButton(
            onPressed: () => ApplicationSettings.router.navigateTo(
              context,
              Routes.chats,
              transition: TransitionType.inFromRight,
            ),
            child: Text('Ver todos'),
          ),
        ),
        Divider(),
        this._buildTitle('Últimas noticias'),
        this._buildNewPreview(
          image: 'https://i.imgur.com/fBjFs4k.png',
          title: 'Título 1',
          date: 'Marzo 3, 2021',
          description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dolor ornare dui blandit aliquam, commodo egestas vestibulum.',
        ),
        this._buildNewPreview(
          image: 'https://i.imgur.com/fBjFs4k.png',
          title: 'Título 2',
          date: 'Marzo 2, 2021',
          description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dolor ornare dui blandit aliquam, commodo egestas vestibulum.',
        ),
        this._buildNewPreview(
          image: 'https://i.imgur.com/fBjFs4k.png',
          title: 'Título 3',
          date: 'Marzo 1, 2021',
          description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dolor ornare dui blandit aliquam, commodo egestas vestibulum.',
        ),
        Container(
          width: double.infinity,
          child: TextButton(
            onPressed: () {},
            child: Text('Ver todas'),
          ),
        ),
      ],
    );
  }
}

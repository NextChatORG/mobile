import 'package:flutter/material.dart';
import 'package:nextchat/core/messages/message.dart';
import 'package:nextchat/screens/messages/components/message_preview_component.dart';
import 'package:nextchat/screens/private_messages/private_messages_screen.dart';
import 'package:nextchat/widgets/logged_widget.dart';
import 'package:nextchat/widgets/navigation_widget.dart';

class MessagesScreen extends StatefulWidget {
  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  Widget build(BuildContext build) {
    return Scaffold(
      body: LoggedWidget(
        paddingBody: EdgeInsets.all(0),
        paddingHeader: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        children: [
          MessagePreviewComponent(
            avatar: "assets/images/fake_faces/friend_6.jpg",
            username: "Diana",
            unreadMessagesCount: 0,
            date: "17:00",
            lastMessage: "You: Okay! See you 👋🏻",
            onClick: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => PrivateMessagesScreen(
                    avatar: "assets/images/fake_faces/friend_6.jpg",
                    username: "Diana",
                    lastOnline: "Last seen recently",
                    messages: [
                      Message(
                        from: MessageFrom.Me,
                        content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dolor ornare dui blandit aliquam, commodo egestas vestibulum.",
                        date: "Yesterday",
                        seen: true,
                      ),
                      Message(
                        from: MessageFrom.Other,
                        content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dolor ornare dui blandit aliquam, commodo egestas vestibulum.",
                        date: "Yesterday",
                        seen: true,
                      ),
                      Message(
                        from: MessageFrom.Me,
                        content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dolor ornare dui blandit aliquam, commodo egestas vestibulum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dolor ornare dui blandit aliquam, commodo egestas vestibulum.",
                        date: "Yesterday",
                        seen: true,
                      ),
                      Message(
                        from: MessageFrom.Me,
                        content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dolor ornare dui blandit aliquam, commodo egestas vestibulum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dolor ornare dui blandit aliquam, commodo egestas vestibulumaa.",
                        date: "Yesterday",
                        seen: true,
                      ),
                      Message(
                        from: MessageFrom.Other,
                        content: "ornare dui blandit aliquam, commodo",
                        date: "Yesterday",
                        seen: true,
                      ),
                      Message(
                        from: MessageFrom.Other,
                        content: "Hi!",
                        date: "16:55",
                        seen: true,
                      ),
                      Message(
                        from: MessageFrom.Other,
                        content: "I need to see you tomorrow",
                        date: "16:56",
                        seen: true,
                      ),
                      Message(
                        from: MessageFrom.Other,
                        content: "Can you be here?",
                        date: "16:57",
                        seen: true,
                      ),
                      Message(from: MessageFrom.Me, content: "Okay! See you 👋🏻", date: "17:00"),
                    ],
                  ),
                ),
              );
            },
          ),
          MessagePreviewComponent(
            avatar: "assets/images/fake_faces/friend_1.jpg",
            username: "Samantha",
            unreadMessagesCount: 1,
            date: "16:28",
            lastMessage: "Hi!",
            onClick: () {},
          ),
          MessagePreviewComponent(
            avatar: "assets/images/fake_faces/friend_2.jpg",
            username: "Josue",
            unreadMessagesCount: 10,
            date: "09:20",
            lastMessage: "I'll send you it tomorrow",
            onClick: () {},
          ),
          MessagePreviewComponent(
            avatar: "assets/images/fake_faces/friend_7.jpg",
            username: "Valen",
            unreadMessagesCount: 0,
            date: "00:15",
            lastMessage: "Good night! 🌚",
            onClick: () {},
          ),
          MessagePreviewComponent(
            avatar: "assets/images/fake_faces/friend_8.jpg",
            username: "Arturo",
            unreadMessagesCount: 0,
            date: "Yesterday",
            lastMessage: "I've finished to fix your computer 🤑",
            onClick: () {},
          ),
          MessagePreviewComponent(
            avatar: "assets/images/fake_faces/friend_3.jpg",
            username: "Diego",
            unreadMessagesCount: 2,
            date: "Yesterday",
            lastMessage: "How are you?",
            onClick: () {},
          ),
          MessagePreviewComponent(
            avatar: "assets/images/fake_faces/friend_4.jpg",
            username: "Alex",
            unreadMessagesCount: 5,
            date: "15-01",
            lastMessage: "I'm waiting your answer...",
            onClick: () {},
          ),
          MessagePreviewComponent(
            avatar: "assets/images/fake_faces/friend_9.jpg",
            username: "Joaquín Gómez",
            unreadMessagesCount: 0,
            date: "02-01",
            lastMessage: "You: That's right! 😎",
            onClick: () {},
          ),
          MessagePreviewComponent(
            avatar: "assets/images/fake_faces/friend_5.jpg",
            username: "Amanda",
            unreadMessagesCount: 1,
            date: "31-12-2019",
            lastMessage: "Happy new year!",
            onClick: () {},
          ),
        ],
      ),
      bottomNavigationBar: NavigationWidget(),
    );
  }
}

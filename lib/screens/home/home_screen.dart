import 'package:flutter/material.dart';
import 'package:nextchat/screens/home/components/new_preview_component.dart';
import 'package:nextchat/screens/home/components/unread_message_preview_component.dart';
import 'package:nextchat/widgets/logged_widget.dart';
import 'package:nextchat/widgets/navigation_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoggedWidget(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 8.0),
            child: Text(
              "Unread messages",
              style: TextStyle(
                color: Colors.grey[400],
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          UnreadMessagePreviewComponent(
            avatar: "assets/images/fake_faces/friend_1.jpg",
            username: "Samantha",
            messagesCount: 1,
            date: "16:28",
            lastMessage: "Hi!",
          ),
          UnreadMessagePreviewComponent(
            avatar: "assets/images/fake_faces/friend_2.jpg",
            username: "Josue",
            messagesCount: 10,
            date: "09:20",
            lastMessage: "I'll send you it tomorrow",
          ),
          UnreadMessagePreviewComponent(
            avatar: "assets/images/fake_faces/friend_3.jpg",
            username: "Diego",
            messagesCount: 2,
            date: "Yesterday",
            lastMessage: "How are you?",
          ),
          UnreadMessagePreviewComponent(
            avatar: "assets/images/fake_faces/friend_4.jpg",
            username: "Alex",
            messagesCount: 5,
            date: "15-01",
            lastMessage: "I'm waiting your answer...",
          ),
          UnreadMessagePreviewComponent(
            avatar: "assets/images/fake_faces/friend_5.jpg",
            username: "Amanda",
            messagesCount: 1,
            date: "31-12-2019",
            lastMessage: "Happy new year!",
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed("/messages");
            },
            child: Text("View all"),
          ),
          Divider(),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              "Last news",
              style: TextStyle(
                color: Colors.grey[400],
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          NewPreviewComponent(
            image: "https://i.imgur.com/fBjFs4k.png",
            title: "Title 1",
            date: "March 3, 2021",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dolor ornare dui blandit aliquam, commodo egestas vestibulum.",
          ),
          NewPreviewComponent(
            image: "https://i.imgur.com/fBjFs4k.png",
            title: "Title 2",
            date: "March 2, 2021",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dolor ornare dui blandit aliquam, commodo egestas vestibulum.",
          ),
          NewPreviewComponent(
            image: "https://i.imgur.com/fBjFs4k.png",
            title: "Title 3",
            date: "March 1, 2021",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dolor ornare dui blandit aliquam, commodo egestas vestibulum.",
          ),
          TextButton(onPressed: () {}, child: Text("View all")),
        ],
      ),
      bottomNavigationBar: NavigationWidget(),
    );
  }
}

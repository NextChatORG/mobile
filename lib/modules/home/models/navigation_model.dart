import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:nextchat/config/routes/routes.dart';
import 'package:nextchat/core/settings/apllication_settings.dart';

class NavigationModel extends StatefulWidget {
  @override
  _NavigationModelState createState() => _NavigationModelState();
}

class _NavigationModelState extends State<NavigationModel> {
  final Map<int, String> _routes = {
    0: Routes.home,
    1: Routes.chats,
    2: Routes.notifications,
    3: "${Routes.profile}/me",
  };

  int _selectedIndex = 0;

  void _changeIndex(int index) {
    if (this._selectedIndex != index) {
      setState(() => this._selectedIndex = index);
    }
  }

  @override
  Widget build(BuildContext context) {
    String path = ModalRoute.of(context).settings.name;
    this._routes.forEach((key, value) {
      if (value == path) {
        this._changeIndex(key);
        return;
      }
    });

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: this._selectedIndex,
      iconSize: 24.0,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      unselectedItemColor: Colors.grey[400],
      selectedItemColor: Colors.indigo,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          activeIcon: Icon(Icons.home_filled),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat_bubble_outline_rounded),
          activeIcon: Icon(Icons.chat_bubble_rounded),
          label: 'Notifications',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications_none_rounded),
          activeIcon: Icon(Icons.notifications_rounded),
          label: 'Messages',
        ),
        BottomNavigationBarItem(
          icon: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(14.0)),
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.asset(
              'assets/images/fake_faces/profile_image.jpg',
              width: 24.0,
              height: 24.0,
            ),
          ),
          activeIcon: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(14.0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.indigo[200],
                  spreadRadius: 2,
                  blurRadius: 4,
                ),
              ],
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.asset(
              'assets/images/fake_faces/profile_image.jpg',
              width: 24.0,
              height: 24.0,
            ),
          ),
          label: 'You',
        ),
      ],
      onTap: (index) {
        if (this._routes.containsKey(index)) {
          TransitionType transition = TransitionType.inFromRight;
          if (index < this._selectedIndex) {
            transition = TransitionType.inFromLeft;
          }

          this._changeIndex(index);
          ApplicationSettings.router.navigateTo(
            context,
            this._routes[index],
            transition: transition,
          );
        }
      },
    );
  }
}

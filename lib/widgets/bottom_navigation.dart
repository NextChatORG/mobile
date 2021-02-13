import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nextchat/pages/chats.dart';
import 'package:nextchat/pages/home.dart';

class BottomNavigation extends StatelessWidget {
  BottomNavigation({Key key, @required this.currentIndex}) : super(key: key);
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: currentIndex,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/outline/home.svg',
                    color: Colors.deepPurple[50], width: 26.0, height: 26.0),
                activeIcon: SvgPicture.asset('assets/icons/solid/home.svg',
                    color: Colors.indigo, width: 26.0, height: 26.0),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/outline/annotation.svg',
                    color: Colors.deepPurple[50], width: 26.0, height: 26.0),
                activeIcon: SvgPicture.asset(
                    'assets/icons/solid/annotation.svg',
                    color: Colors.indigo,
                    width: 26.0,
                    height: 26.0),
                label: 'Chats'),
          ],
          onTap: (index) {
            switch (index) {
              case 0:
                Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage()));
                break;
              case 1:
                Navigator.push(context, MaterialPageRoute(builder: (_) => ChatsPage()));
                break;
            }
          },
        ));
  }
}

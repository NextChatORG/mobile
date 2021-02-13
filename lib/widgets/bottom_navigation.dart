import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nextchat/pages/home.dart';

class BottomNavigation extends StatefulWidget {
  BottomNavigation({Key key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;

  void _setCurrentIndex(index) {
      setState(() {
      _currentIndex = index;  
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: _currentIndex,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/outline/annotation.svg',
                    color: Colors.deepPurple[50], width: 30.0, height: 30.0),
                activeIcon: SvgPicture.asset(
                    'assets/icons/solid/annotation.svg',
                    color: Colors.indigo,
                    width: 30.0,
                    height: 30.0),
                label: 'Chats'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/outline/home.svg',
                    color: Colors.deepPurple[50], width: 30.0, height: 30.0),
                activeIcon: SvgPicture.asset('assets/icons/solid/home.svg',
                    color: Colors.indigo, width: 30.0, height: 30.0),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/outline/globe.svg',
                    color: Colors.deepPurple[50], width: 30.0, height: 30.0),
                activeIcon: SvgPicture.asset('assets/icons/solid/globe.svg',
                    color: Colors.indigo, width: 30.0, height: 30.0),
                label: 'Home')
          ],
          onTap: (index) {
            _setCurrentIndex(index);
          },
        ));
  }
}

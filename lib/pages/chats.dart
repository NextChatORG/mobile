import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nextchat/widgets/bottom_navigation.dart';

class ChatsPage extends StatelessWidget {
  ChatsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(bottom: 8.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset('assets/images/texting.svg', width: 200.0, height: 200.0,),
                Text("Chats", style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20.0,
                        color: Colors.indigo,
                ),)
              ])),
      bottomNavigationBar: BottomNavigation(
        currentIndex: 1,
      ),
    );
  }
}

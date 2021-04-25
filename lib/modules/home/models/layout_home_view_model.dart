import 'package:flutter/material.dart';
import 'package:nextchat/modules/home/models/navigation_model.dart';
import 'package:nextchat/widgets/nextchat_logo.dart';

class LayoutHomeViewModel extends StatelessWidget {
  final EdgeInsetsGeometry childrenMargin;
  final List<Widget> children;

  LayoutHomeViewModel({
    this.childrenMargin = const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
    this.children = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 4.0,
                horizontal: 24.0,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[300],
                    blurRadius: 2.0,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NextChatLogo(
                    textSize: 24.0,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.search_rounded,
                      color: Colors.grey[400],
                      size: 24.0,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: this.childrenMargin,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: this.children,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationModel(),
    );
  }
}

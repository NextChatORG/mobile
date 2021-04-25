import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nextchat/widgets/nextchat_logo.dart';

class LayoutIndexViewModel extends StatelessWidget {
  final bool withLogoAndTitle;

  final String title;
  final double titleSize;

  final List<Widget> topChildren;
  final List<Widget> children;

  final EdgeInsetsGeometry actionsMargin;
  final List<Widget> actions;

  LayoutIndexViewModel({
    this.withLogoAndTitle = true,
    this.title = '',
    this.titleSize = 34.0,
    this.topChildren = const [],
    this.children = const [],
    this.actionsMargin = const EdgeInsets.only(top: 12.0),
    this.actions = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  vertical: 12.0,
                  horizontal: 24.0,
                ),
                child: Column(
                  children: [
                    ...((this.withLogoAndTitle) ? [
                      NextChatLogo(),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(
                          top: 48.0,
                          bottom: 12.0,
                        ),
                        child: Text(
                          this.title,
                          style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: this.titleSize,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ] : []),
                    ...this.children,
                    Container(
                      margin: this.actionsMargin,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: this.actions,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ...this.topChildren,
          ],
        ),
      ),
    );
  }
}

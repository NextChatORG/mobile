import 'package:flutter/material.dart';

class LoggedWidget extends StatelessWidget {
  final EdgeInsetsGeometry paddingBody;
  final EdgeInsetsGeometry paddingHeader;
  final List<Widget> children;

  LoggedWidget({
    Key key,
    this.paddingBody = const EdgeInsets.symmetric(horizontal: 16.0),
    this.paddingHeader = const EdgeInsets.symmetric(vertical: 8.0),
    @required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: paddingBody,
        children: [
          Container(
            padding: paddingHeader,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "NextChat",
                  style: TextStyle(
                    color: Colors.indigo,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.search_rounded,
                    color: Colors.indigo[200],
                    size: 24.0,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          ...this.children,
        ],
      ),
    );
  }
}

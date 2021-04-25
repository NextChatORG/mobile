import 'package:flutter/material.dart';
import 'package:nextchat/modules/home/models/layout_home_view_model.dart';

class NotificationsScreen extends StatefulWidget {
  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return LayoutHomeViewModel(
      children: [
        Text('Notifications'),
      ],
    );
  }
}

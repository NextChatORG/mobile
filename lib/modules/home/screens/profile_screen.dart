import 'package:flutter/material.dart';
import 'package:nextchat/modules/home/models/layout_home_view_model.dart';

class ProfileScreen extends StatefulWidget {
  final String username;

  ProfileScreen(this.username);

  @override
  _ProfileScreenState createState() => _ProfileScreenState(this.username);
}

class _ProfileScreenState extends State<ProfileScreen> {
  final String username;

  _ProfileScreenState(this.username);

  @override
  Widget build(BuildContext context) {
    return LayoutHomeViewModel(
      children: [
        Text("Perfil de ${this.username}"),
      ],
    );
  }
}
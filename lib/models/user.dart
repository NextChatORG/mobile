import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class UserAccount {
  final String id;
  final String username;
  final String profileImage;
  bool currentAccount;

  UserAccount(
      {@required this.id,
      @required this.username,
      this.profileImage,
      this.currentAccount});

  factory UserAccount.fromMap(Map<String, dynamic> data) => new UserAccount(
      id: data["id"],
      username: data["username"],
      profileImage: data["profile_image"],
      currentAccount: false);

  void setAsCurrentAccount() {
    currentAccount = true;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'username': this.username,
      'profile_image': this.profileImage,
      'current_account': this.currentAccount
    };
  }

  Future<bool> create(Database db) async {
    var result = await db.insert("user_accounts", toMap());
    return result != 0;
  }
}

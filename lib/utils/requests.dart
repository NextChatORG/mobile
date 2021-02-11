import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nextchat/settings.dart';

Future<void> post<T>(String path,
    {@required Map<String, dynamic> body,
    void Function(int statusCode, Map<String, dynamic> data) onError,
    void Function(Map<String, dynamic> data) onSuccess}) async {
  http.Response response = await http.post(Uri.http(API_URL, path),
      headers: {'Content-Type': "application/json"}, body: jsonEncode(body));

  Map<String, dynamic> data = new Map();
  if (response.body.isNotEmpty &&
      (response.body.startsWith("{") || response.body.startsWith("["))) {
    data = jsonDecode(response.body);
  }

  if (response.statusCode != 200 && onError != null) {
    onError(response.statusCode, data);
    return;
  }

  if (response.statusCode == 200 && onSuccess != null) {
    onSuccess(data);
  }
}

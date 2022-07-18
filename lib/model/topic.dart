import 'dart:async';
import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
Future<List<Topic>> fetchTopics(http.Client client) async {
  const jsonKey = 'topics';
  final prefs = await SharedPreferences.getInstance();

  final connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.none) {

print(prefs.getString(jsonKey));
    return compute(parseTopics, prefs.getString(jsonKey)!);

  } else {
    final response = await client
        .get(Uri.parse('https://orthodoxmelsalat.herokuapp.com/api/topics'));
    await prefs.setString(jsonKey, response.body);
    return compute(parseTopics, response.body);
  }
  }

// A function that converts a response body into a List<Topic>.
List<Topic> parseTopics(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Topic>((json) => Topic.fromJson(json)).toList();
}

class Topic {
  final int id;
  final String title;
  final String detail;
  final String banner;

  const Topic({
    required this.id,
    required this.title,
    required this.detail,
    required this.banner,
  });

  factory Topic.fromJson(Map<String, dynamic> json) {
    return Topic(
      id: json['id'] as int,
      title: json['title'] as String,
      detail: json['detail'] as String,
      banner: json['banner'] as String,
    );
  }
}

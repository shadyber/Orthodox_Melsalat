import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<Topic>> fetchTopics(http.Client client) async {
  final response = await client
      .get(Uri.parse('http://192.168.0.139:8000/api/topics'));

  // Use the compute function to run parseTopics in a separate isolate.
  return compute(parseTopics, response.body);
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

import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<Question>> fetchQuestions(http.Client client, int topic_id) async {
  final response = await client
      .get(Uri.parse("http://192.168.0.139:8000/api/topic/"+topic_id.toString()));

  // Use the compute function to run parseQuestions in a separate isolate.
  return compute(parseQuestions, response.body);
}

// A function that converts a response body into a List<Question>.
List<Question> parseQuestions(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Question>((json) => Question.fromJson(json)).toList();
}

class Question {
  final int id;
  final int topic_id;
  final String title;
  final String detail;
  final String attachment;

  const Question({
    required this.id,
    required this.title,
    required this.detail,
    required this.topic_id,
    required this.attachment,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'] as int,
      topic_id: json['topic_id'] as int,
      title: json['title'] as String,
      detail: json['detail'] as String,
      attachment: json['attachment'] as String,
    );
  }
}

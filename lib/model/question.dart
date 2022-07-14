import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:orthodox_melsalat/model/answer.dart';

Future<List<Question>> fetchQuestions(http.Client client, int topic_id) async {
  final response = await client
      .get(Uri.parse("https://orthodoxmelsalat.herokuapp.com/api/topic/"+topic_id.toString()));

  // Use the compute function to run parseQuestions in a separate isolate.
  return compute(parseQuestions, response.body);
}

// A function that converts a response body into a List<Question>.
List<Question> parseQuestions(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Question>((json) => Question.fromJson(json)).toList();
}

class Question {
  final int? id;
  final int? topic_id;
  final String? title;
  final String? detail;
  final String? attachment;
  final Answer? answer;

   Question({
      this.id,
      this.title,
      this.detail,
      this.topic_id,
      this.attachment,
      this.answer,

  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'] as int,
      topic_id: json['topic_id'] as int,
      title: json['title'] as String,
      detail: json['detail'] as String,
      attachment: json['attachment'] as String,
      answer: json["answer"] == null ? null : Answer.fromJson(json["answer"]),
    );
  }


  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "detail": detail,
    "topic_id": topic_id,
    "attachment": attachment,
    "answer": answer == null ? 'null' : answer!.toJson(),
  };

}

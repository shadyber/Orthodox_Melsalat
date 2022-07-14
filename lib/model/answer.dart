import 'dart:convert';

import 'package:orthodox_melsalat/model/question.dart';


class Answer {
   Answer({
    this.id,
      this.questionId,
     this.shortAnswer,
     this.longAnswer,
     this.question,
  }
  );

    int? id;
   int? questionId;
   String? shortAnswer;
  String? longAnswer;
   Question? question;



  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
    id: json["id"],
    questionId: json["question_id"],
    shortAnswer: json["short_answer"],
    longAnswer: json["long_answer"],
      question: Question.fromJson(json["question"]),

  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "question_id": questionId,
    "short_answer": shortAnswer,
    "long_answer": longAnswer
  };
}

import 'package:flutter/material.dart';
import 'package:orthodox_melsalat/model/answer.dart';

class AnswerPage extends StatelessWidget {
  const AnswerPage({super.key, required this.title ,required this.answer});

  final String title;
  final Answer answer;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(answer.longAnswer!),
        Text(answer.shortAnswer!),
      ],

    );
  }
}

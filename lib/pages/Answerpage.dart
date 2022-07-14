import 'package:flutter/material.dart';
import 'package:orthodox_melsalat/components/MainAppbar.dart';
import 'package:orthodox_melsalat/components/NavigationDrawer.dart';
import 'package:orthodox_melsalat/model/answer.dart';
import 'package:orthodox_melsalat/model/question.dart';

class AnswerPage extends StatelessWidget {
  const AnswerPage({super.key, required this.title ,required this.answer , required this.question});

  final String title;
  final Answer answer;
  final Question question;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Scaffold(
        backgroundColor: Colors.white60,
        drawer: NavigationDrawer(),
        appBar: MainAppBar(title: 'Answer For '+ question.title!,),
        body: Column(

          children: [
            Text(question.title!,style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 12,
            )),
            Text(question.detail!,style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 11,
            )),
            SizedBox(height: 3,),
            Text('Answer', style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 25,
            ),),
            SizedBox(height: 5,),
            Text(answer.shortAnswer.toString()),
            SizedBox(height: 5,),
            Text(answer.longAnswer.toString()),

          ],
        ),
      ),
    );
  }
}

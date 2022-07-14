import 'package:flutter/material.dart';

import 'package:orthodox_melsalat/components/MainAppbar.dart';
import 'package:orthodox_melsalat/components/NavigationDrawer.dart';
import 'package:orthodox_melsalat/model/answer.dart';
import 'package:orthodox_melsalat/model/question.dart';
import 'package:orthodox_melsalat/model/topic.dart';
import 'package:http/http.dart' as http;
import 'package:orthodox_melsalat/pages/Answerpage.dart';

class QuestionPage extends StatelessWidget {
  const QuestionPage({super.key, required this.title ,required this.topic});

  final String title;
  final Topic topic;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      home: Scaffold(
        drawer: NavigationDrawer(),
        appBar: MainAppBar(title: title.toString(),),
        body: Column(children: <Widget>[
           Image.network(topic.banner),
           Text("Question Under this Topic"),
           Expanded(
              child:  Align(
                  alignment: Alignment.bottomCenter,
                  child: FutureBuilder<List<Question>>(

                    future: fetchQuestions(http.Client(),topic.id),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return const Center(
                          child: Text('An error has occurred!'),
                        );
                      } else if (snapshot.hasData) {
                        return QuestionsList(Questions: snapshot.data!);
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),

              )
          )
        ]),
      
      ),

    );
  }
}

class QuestionsList extends StatelessWidget {
  const QuestionsList({super.key, required this.Questions});

  final List<Question> Questions;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(

      itemCount: Questions.length,
      itemBuilder: (context, index) {

        return ListTile(
          title: Text(Questions[index].title!),
          subtitle: Text(Questions[index].detail!),
          leading: Image.network(Questions[index].attachment!),
          trailing: Icon(Icons.arrow_forward_ios_rounded),
          onTap: (){
            if(Questions[index].answer!=null){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  AnswerPage(
                  title: Questions[index].title!,
                  answer:  Answer(id: Questions[index].answer?.id, shortAnswer: Questions[index].answer?.shortAnswer, longAnswer:Questions[index].answer?.longAnswer),
                )),
              );
            }

          },
        );
      },
    );
  }
}
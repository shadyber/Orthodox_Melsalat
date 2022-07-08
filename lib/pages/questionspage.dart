import 'package:flutter/material.dart';
import 'package:orthodox_melsalat/components/NavigationDrawer.dart';
import 'package:orthodox_melsalat/model/question.dart';
import 'package:orthodox_melsalat/model/topic.dart';
import 'package:http/http.dart' as http;
class QuestionPage extends StatelessWidget {
   QuestionPage({super.key, required this.title , required this.topic});

  final String title;
  final Topic topic;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      home: Scaffold(

drawer: NavigationDrawer(),
       body: CustomScrollView(
       slivers: <Widget>[
         SliverAppBar(
           title: Text(title),
           backgroundColor: Colors.green,
           expandedHeight: 300.0,
           flexibleSpace: FlexibleSpaceBar(
             background:  Image.network(topic.banner, fit: BoxFit.cover),
           ),
         ),
         SliverFixedExtentList(
           itemExtent: 180.0,

           delegate: SliverChildListDelegate(
             [
              Container(

                child: FutureBuilder<List<Question>>(
                 future: fetchQuestions(http.Client(),topic.id),
                 builder: (context, snapshot) {
                   if (snapshot.hasError) {
                     return const Center(
                       child: Text('An error has occurred!'),
                     );
                   } else if (snapshot.hasData) {
                     return QuestionList(questions: snapshot.data!);
                   } else {
                     return const Center(
                       child: CircularProgressIndicator(),
                     );
                   }
                 },
               ),
              )
             ],
           ),
         ),
       ],
     ),

      ),
    );
  }
}

class QuestionList extends StatelessWidget {
  const QuestionList({super.key, required this.questions});

  final List<Question> questions;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(

      itemCount: questions.length,
      itemBuilder: (context, index) {

        return ListTile(
          title: Text(questions[index].title),
          subtitle: Text(questions[index].detail),
          leading: Image.network(questions[index].attachment),
          trailing: Icon(Icons.arrow_forward_ios_rounded),
          onTap: (){



          },
        );
      },
    );
  }
}
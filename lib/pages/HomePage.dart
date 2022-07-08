import 'package:flutter/material.dart';
import 'package:orthodox_melsalat/model/topic.dart';
import 'package:http/http.dart' as http;
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return  FutureBuilder<List<Topic>>(
    future: fetchTopics(http.Client()),
    builder: (context, snapshot) {
    if (snapshot.hasError) {
    return const Center(
    child: Text('An error has occurred!'),
    );
    } else if (snapshot.hasData) {
    return TopicsList(Topics: snapshot.data!);
    } else {
    return const Center(
    child: CircularProgressIndicator(),
    );
    }
    },
    );
  }
}

class TopicsList extends StatelessWidget {
  const TopicsList({super.key, required this.Topics});

  final List<Topic> Topics;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(

      itemCount: Topics.length,
      itemBuilder: (context, index) {

        return ListTile(
          title: Text(Topics[index].title),
          subtitle: Text(Topics[index].detail),
          leading: Image.network(Topics[index].banner),
          trailing: Icon(Icons.arrow_forward_ios_rounded),
        );
      },
    );
  }
}
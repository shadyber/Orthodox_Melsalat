import 'package:flutter/material.dart';
import 'package:orthodox_melsalat/components/NavigationDrawer.dart';
import 'package:orthodox_melsalat/pages/HomePage.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Orthodox Mels Alat',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Orthodox Mels Alat'),
        ),
        drawer: NavigationDrawer(),
        body:MyHomePage(title: 'Topics Menu'),
      ),
    );
  }
}
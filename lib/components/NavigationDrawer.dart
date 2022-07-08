import 'package:flutter/material.dart';
import 'package:orthodox_melsalat/pages/HomePage.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Drawer(

child: ListView(
  children: [
    ListTile(
      title: Text('Home'),
      subtitle: Text('Load Topic Menu'),
      leading: Icon(Icons.home),
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MyHomePage(
            title: 'Home',

          )),
        );
      },
    ),


  ],
),

    );

  }
}

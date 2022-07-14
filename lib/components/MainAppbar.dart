import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const MainAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
    title: Text(title),
      actions: [
         IconButton(
          onPressed: (){

          },
           icon: const Icon(Icons.church_sharp),
        ),
        IconButton(
          onPressed: (){

          },
          icon:const Icon(Icons.question_mark_rounded),
        ),
        IconButton(
          onPressed: (){

          }, icon: const Icon(Icons.person),
        )
      ],

    );
  }

  static final _appBar = AppBar();
  @override
  Size get preferredSize => _appBar.preferredSize;
}
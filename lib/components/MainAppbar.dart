import 'package:flutter/material.dart';

class MainAppbar extends StatelessWidget implements PreferredSizeWidget{
  const MainAppbar({Key? key , required this.title}) : super(key: key);
final String title;
  @override
  Widget build(BuildContext context) {
    return  AppBar(
      title: Text(title),
      actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.home)), 
        IconButton(onPressed: (){}, icon: Icon(Icons.question_mark)),
        IconButton(onPressed: (){}, icon: Icon(Icons.person))
      ],
    );

  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(38.0);


}

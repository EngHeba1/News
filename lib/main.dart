import 'package:flutter/material.dart';
import 'package:news_task/screens/tabs_screen.dart';

import 'layout/home_layout.dart';
import 'models/sourcesResponce.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  //const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeLayout.routName,
      routes:{
        HomeLayout.routName :(context) => HomeLayout(),


      } ,

    );
  }
}


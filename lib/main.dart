import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_task/screens/categories_screen.dart';
import 'package:news_task/screens/news_details.dart';
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
    return ScreenUtilInit(
        designSize: const Size(412, 870),
        minTextAdapt: true,
        splitScreenMode: true,
      builder: (context, child) =>
      MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute:HomeLayout.routName,
        routes:{
          HomeLayout.routName :(context) => HomeLayout(),
          NewsDetails.routName : (context) => NewsDetails(),


        } ,

      ),
    );
  }
}


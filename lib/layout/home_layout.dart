import 'package:flutter/material.dart';

class HomeLayout extends StatelessWidget {
  //const HomeLayout({super.key});
static const String routName="Home";

  const HomeLayout({super.key});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("assets/images/pattern.png"),
        Scaffold(appBar: AppBar(title: Text("News App"),),)
      ],
    );
  }
}

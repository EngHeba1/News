import 'package:flutter/material.dart';
import 'package:news_task/screens/tabs_screen.dart';

import '../network/remot/api_manger.dart';

class HomeLayout extends StatelessWidget {
  //const HomeLayout({super.key});
  static const String routName = "Home";

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
         Image.asset("assets/images/pattern.png"),
        Scaffold(
          //backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Color(0xff39A552),
            title: Text(
              "News App",),
            elevation: 0,

            toolbarHeight: 90,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            centerTitle: true,
          ),
          body: FutureBuilder(
            future: ApiManger.getSources(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Column(
                  children: [
                    Text("Sorry something Wrong"),
                    TextButton(onPressed: () {}, child: Text("TRY again"))
                  ],
                );
              }
              if(snapshot.data?.status !="ok"   ){
                return Column(
                  children: [
                    Text("Sorry something Wrong"),
                    TextButton(onPressed: () {}, child: Text("TRY again"))
                  ],
                );
              }
              var sources=snapshot.data?.sources??[];
              return TabsScreen(sources);
            },
          ),
        )
      ],
    );
  }
}

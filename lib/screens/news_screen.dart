import 'package:flutter/material.dart';
import 'package:news_task/screens/tabs_screen.dart';

import '../models/category_model.dart';
import '../network/remot/api_manger.dart';

class NewsScreen extends StatelessWidget {
  //const NewsScreen({super.key});
  CategoryModel categoryModel;

  NewsScreen(this.categoryModel);
  @override
  Widget build(BuildContext context) {
    return  FutureBuilder(
      future: ApiManger.getSources(categoryModel.id),
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
    );
  }
}

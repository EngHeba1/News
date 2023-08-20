import 'package:flutter/material.dart';
import 'package:news_task/models/category_model.dart';
import 'package:news_task/screens/news_screen.dart';
import 'package:news_task/screens/tabs_screen.dart';

import '../network/remot/api_manger.dart';
import '../screens/categories_screen.dart';

class HomeLayout extends StatefulWidget {
  //const HomeLayout({super.key});
  static const String routName = "Home";

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
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
          body: categoryModel==null?CategoriesScreen(onCategorySelect):NewsScreen(categoryModel!),

        )
      ],
    );
  }

  CategoryModel? categoryModel=null;

  void onCategorySelect( cate) {
    categoryModel=cate;
    setState(() {

    });

  }
}

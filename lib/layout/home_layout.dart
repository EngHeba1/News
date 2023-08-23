import 'package:flutter/material.dart';
import 'package:news_task/models/category_model.dart';
import 'package:news_task/screens/news_screen.dart';
import '../screens/categories_screen.dart';
import '../screens/news_search.dart';
import '../screens/widgets/drawer_widget.dart';

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
            title: Text(categoryModel==null? "News App" : categoryModel!.name,),
            elevation: 0,

            toolbarHeight: 90,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            centerTitle: true,
            actions: [Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                onPressed: () {
                showSearch(context: context,
                    delegate:Search()); },
                icon:Icon(Icons.search,size: 30),),
            )],
          ),
          drawer: DrawerWidget(onDrawerSelect),
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

  void onDrawerSelect(number) {
    if (number==DrawerWidget.catogry){
      categoryModel=null;
    }
    if(number==DrawerWidget.setting){

    }
    Navigator.pop(context);
 setState(() {

 });
  }
}

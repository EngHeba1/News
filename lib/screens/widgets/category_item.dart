import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_task/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  //const CategoryItem({super.key});
  CategoryModel categoryModel;
  int index;

  CategoryItem(this.categoryModel, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: categoryModel.color,
        borderRadius: BorderRadius.only(topLeft:Radius.circular(30),topRight:Radius.circular(30),
        bottomRight: index.isOdd?Radius.circular(30):Radius.circular(0),
        bottomLeft: index.isEven?Radius.circular(30):Radius.circular(0),)
      ),
      height:54 .h ,
      width:100 .w,
      child: Column(children: [
        Image.asset(
          categoryModel.image,
          height: 120.h,
        ),
        SizedBox(height: 0.02.sh,),
        Text(
          categoryModel.name,
           style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 24.sp,color: Colors.white)),

      ]),
    );
  }
}

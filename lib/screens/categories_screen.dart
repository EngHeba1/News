import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_task/models/category_model.dart';
import 'package:news_task/screens/widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  //const CategoriesScreen({super.key});
  Function onCategorySelect;

  CategoriesScreen(this.onCategorySelect);

  static const String routName = "Categories";
  var categores = CategoryModel.getCategories();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(
                height: 0.02.sh,
              ),
              Center(
                child: Text("Pick your category of interest",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 20.sp, fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                height: 0.05.sh,
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16),
                  itemBuilder: (context, index) =>
                      InkWell(
                        onTap: () {
                          onCategorySelect(categores[index]);
                        },
                          child: CategoryItem(categores[index], index)),
                  itemCount: categores.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

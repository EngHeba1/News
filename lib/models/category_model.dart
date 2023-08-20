import 'dart:ui';

class CategoryModel{
  String id;
  String name;
  String image;
  Color color;
  CategoryModel(this.id, this.name, this.image, this.color);
  static List<CategoryModel>getCategories(){
    return[
      CategoryModel("sports", "Sports", "assets/images/sports.png", const Color(0xffC91C22)),
      CategoryModel("business", "Business", "assets/images/bussines.png", const Color(0xffCF7E48)),
      CategoryModel("health", "Health", "assets/images/health.png", const Color(0xffED1E79)),
      CategoryModel("general", "General", "assets/images/general.png", const Color(0xff58c926)),
      CategoryModel("entertainment", "Entertainment", "assets/images/environment.png", const Color(0xff4882CF)),
      CategoryModel("science", "Science", "assets/images/science.png", const Color(0xffF2D352)),
      CategoryModel("technology", "Technology", "assets/images/Politics.png", const Color(0xff003E90)),
    ];
   // business entertainment general health science sports technology
  }
}
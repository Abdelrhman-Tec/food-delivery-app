class CategoryModel {
  final String name;

  CategoryModel({required this.name});
  static List<CategoryModel> categoryList = [
    CategoryModel(name: 'Offers'),
    CategoryModel(name: 'Burger'),
    CategoryModel(name: 'Pizza'),
    CategoryModel(name: 'Donut'),
  ];
}

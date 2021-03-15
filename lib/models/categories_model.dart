class CategoriesModel {
  final int category_id;
  final String category_name;
  final String description;
  final String banner;
  final List<SubCategoryModel> subcategory;

  CategoriesModel(
      {this.category_id, this.category_name, this.description, this.banner, this.subcategory});

  factory CategoriesModel.fromJson(Map<String, dynamic> parsedJson) {
    return CategoriesModel(
      category_id: int.parse(parsedJson['category_id']),
      category_name: parsedJson['category_name'],
      description: parsedJson['description'],
      banner: parsedJson['banner'],
      subcategory: List<SubCategoryModel>.from(parsedJson['sub_categories'].map((subcategory){return SubCategoryModel.fromJson(subcategory);}).toList(),),
    );
  }
}

class SubCategoryModel {
  final int sub_category_id;
  final String sub_category_name;
  final int category;
  final String banner;

  SubCategoryModel(
      {
        this.sub_category_id,
      this.sub_category_name,
      this.category,
      this.banner
      });

  factory SubCategoryModel.fromJson(Map<String, dynamic> parsedJson) {
    return SubCategoryModel(
      sub_category_id: int.parse(parsedJson['sub_category_id']),
      sub_category_name: parsedJson['sub_category_name'],
      category: int.parse(parsedJson['category']),
      banner: parsedJson['banner'],
    );
  }
}

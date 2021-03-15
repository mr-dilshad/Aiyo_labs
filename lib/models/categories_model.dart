class CategoriesModel {
  final int categoryId;
  final String categoryName;
  final String description;
  final String banner;
  final List<SubCategoryModel> subcategory;

  CategoriesModel(
      {this.categoryId, this.categoryName, this.description, this.banner, this.subcategory});

  factory CategoriesModel.fromJson(Map<String, dynamic> parsedJson) {
    return CategoriesModel(
      categoryId: int.parse(parsedJson['category_id']),
      categoryName: parsedJson['category_name'],
      description: parsedJson['description'],
      banner: parsedJson['banner'],
      subcategory: List<SubCategoryModel>.from(parsedJson['sub_categories'].map((subcategory){return SubCategoryModel.fromJson(subcategory);}).toList(),),
    );
  }
}

class SubCategoryModel {
  final int subCategoryId;
  final String subCategoryName;
  final int category;
  final String banner;

  SubCategoryModel(
      {
        this.subCategoryId,
      this.subCategoryName,
      this.category,
      this.banner
      });

  factory SubCategoryModel.fromJson(Map<String, dynamic> parsedJson) {
    return SubCategoryModel(
      subCategoryId: int.parse(parsedJson['sub_category_id']),
      subCategoryName: parsedJson['sub_category_name'],
      category: int.parse(parsedJson['category']),
      banner: parsedJson['banner'],
    );
  }
}

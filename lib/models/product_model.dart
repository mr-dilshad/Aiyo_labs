class ProductModel {
  final int productId;
  final String title;
  final int category;
  final String description;
  final int subCategory;
  final int numOfImgs;
  final int salePrice;
  final int purchasePrice;
  final int shoppinCost;
  final String imageUrl;

  ProductModel(
      {this.productId,
      this.title,
      this.category,
      this.description,
      this.subCategory,
      this.numOfImgs,
      this.salePrice,
      this.purchasePrice,
      this.shoppinCost,
      this.imageUrl});

  factory ProductModel.fromJson(Map<String, dynamic> parsedJson) {
    return ProductModel(
      productId: parsedJson['product_id'],
      title: parsedJson['title'],
      category: parsedJson['category'],
      description: parsedJson['description'],
      subCategory: parsedJson['sub_category'],
      numOfImgs: parsedJson['num_of_imgs'],
      salePrice: parsedJson['sale_price'],
      purchasePrice: parsedJson['purchase_price'],
      shoppinCost: parsedJson['shopping_cost'],
      imageUrl: parsedJson['image_url'],
    );
  }
}

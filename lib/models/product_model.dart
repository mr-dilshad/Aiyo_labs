class ProductModel {
  final int product_id;
  final String title;
  final int category;
  final String description;
  final int sub_category;
  final int num_of_imgs;
  final int sale_price;
  final int purchase_price;
  final int shopping_cost;
  final String image_url;

  ProductModel(
      {this.product_id,
      this.title,
      this.category,
      this.description,
      this.sub_category,
      this.num_of_imgs,
      this.sale_price,
      this.purchase_price,
      this.shopping_cost,
      this.image_url});

  factory ProductModel.fromJson(Map<String, dynamic> parsedJson) {
    return ProductModel(
      product_id: parsedJson['product_id'],
      title: parsedJson['title'],
      category: parsedJson['category'],
      description: parsedJson['description'],
      sub_category: parsedJson['sub_category'],
      num_of_imgs: parsedJson['num_of_imgs'],
      sale_price: parsedJson['sale_price'],
      purchase_price: parsedJson['purchase_price'],
      shopping_cost: parsedJson['shopping_cost'],
      image_url: parsedJson['image_url'],
    );
  }
}

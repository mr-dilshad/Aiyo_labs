import 'package:aiyo/models/categories_model.dart';
import 'package:aiyo/models/product_model.dart';
import 'package:aiyo/network_provider/category_api_provider.dart';
import 'package:aiyo/network_provider/product_api_provider.dart';

class InventoryRepository {
  final categoryApiProvider = CategoryApiProvider();
  final productApiProvider = ProductApiProvider();

  Future<List<CategoriesModel>> fetchAllCategories() {
    return categoryApiProvider.fetchCatogories();
  }

  Future<List<ProductModel>> fetchAllProducts(int categoryId, int subCategoryId) {
    return productApiProvider.fetchProducts(categoryId, subCategoryId);
  }
}

import 'dart:async';

import 'package:aiyo/models/categories_model.dart';
import 'package:aiyo/models/product_model.dart';

import '../repository/inventory_repository.dart';

class InventoryBloc {
  final _repository = InventoryRepository();
  final _categoriesFetcher = StreamController<List<CategoriesModel>>();
  final _productsFetcher = StreamController<List<ProductModel>>();

  Stream<List<CategoriesModel>> get allCategories => _categoriesFetcher.stream;
  Stream<List<ProductModel>> get allProducts => _productsFetcher.stream;

  fetchAllCategories() async {
    List<CategoriesModel> categories = await _repository.fetchAllCategories();
    _categoriesFetcher.sink.add(categories);
  }

  fetchAllProducts(int categoryId, int subCategoryId) async {
    List<ProductModel> products = await _repository.fetchAllProducts(categoryId, subCategoryId);
    _productsFetcher.sink.add(products);
  }

  dispose() {
    _categoriesFetcher.close();
    _productsFetcher.close();
  }
}

final bloc = InventoryBloc();

import 'dart:convert';
import 'package:aiyo/models/product_model.dart';
import 'package:http/http.dart' show Client;

class ProductApiProvider {
  Client client = Client();
  //paste your api endpoint here
  final _baseUrl = 'https://interface.huviapp.co';
  final _path = '/api/v1/index.php/masterapi/get_products';
  var map = new Map<String, dynamic>();
  
  Future<List<ProductModel>> fetchProducts(
      int categoryId, int subCategoryId) async {
    map['category'] = '1';
    final response = await client.post(
        '$_baseUrl$_path',
        body: {'category': '1'});
    print(response.body);
    if (response.statusCode == 200) {
      return (List<ProductModel>.from(json
          .decode(response.body)['data']
          .map((category) => ProductModel.fromJson(category))
          .toList()));
    } else {
      throw Exception('Failed to load post');
    }
  }
}

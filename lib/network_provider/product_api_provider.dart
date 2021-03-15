import 'dart:convert';
import 'package:aiyo/models/product_model.dart';
import 'package:http/http.dart' show Client;

class ProductApiProvider {
  Client client = Client();
  //paste your api endpoint here
  final _url =
      'https://interface.huviapp.co/api/v1/index.php/masterapi/get_products';

  Future<List<ProductModel>> fetchProducts(
      int categoryId, int subCategoryId) async {
    final response = await client.post(
        Uri.parse(_url),
        body: {'category': categoryId.toString()});
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

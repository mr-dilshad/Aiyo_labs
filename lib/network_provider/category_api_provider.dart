import 'dart:convert';

import 'package:aiyo/models/categories_model.dart';
import 'package:http/http.dart' show Client;

class CategoryApiProvider {
  Client client = Client();
  //paste your api endpoint here
  final _url =
      'https://interface.huviapp.co/api/v1/index.php/masterapi/get_categories';

  Future<List<CategoriesModel>> fetchCatogories() async {
    final response = await client.get(Uri.parse(_url));
    if (response.statusCode == 200) {
      print(response.body);
      return (List<CategoriesModel>.from(json.decode(response.body)['data']
      .map((category) => CategoriesModel.fromJson(category))
      .toList()));
      // return json
      //     .decode(response.body)['data']
      //     .map((category) => CategoriesModel.fromJson(category))
      //     .toList();
    } else {
      throw Exception('Failed to load post');
    }
  }
}

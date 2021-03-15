import 'package:aiyo/bloc/inventory_bloc.dart';
import 'package:aiyo/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  final String categoryName;
  final int categoryId;
  final int subCategoryId;

  ProductScreen({this.categoryName, this.categoryId, this.subCategoryId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
      ),
      body: StreamBuilder(
        stream: bloc.fetchAllProducts(categoryId, subCategoryId),
        builder: (context, AsyncSnapshot<List<ProductModel>> snapshot) {
          if (snapshot.hasData) {
            print('\n\n\n\nsnapshot.data');
            return Column(
              children: <Widget>[
                Text(
                  'Products',
                  style: Theme.of(context).primaryTextTheme.headline6,
                ),
                Card(
                    child: Image.network(
                  snapshot.data[0].image_url,
                  height: 250,
                  errorBuilder: (context, error, stackTrace) => Text(
                    error.toString(),
                    overflow: TextOverflow.ellipsis,
                  ),
                )),
              ],
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

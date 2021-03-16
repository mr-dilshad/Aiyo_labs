import 'package:aiyo/bloc/inventory_bloc.dart';
import 'package:aiyo/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  final String categoryName;
  final int categoryId;
  final int subCategoryId;

  ProductScreen({this.categoryName, this.categoryId, this.subCategoryId});

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    bloc.fetchAllProducts(widget.categoryId, widget.subCategoryId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName),
      ),
      body: StreamBuilder(
        stream: bloc.allProducts,
        builder: (context, AsyncSnapshot<List<ProductModel>> snapshot) {
          if (snapshot.hasData) {
            print('\n\n\n\n${snapshot.data}');
            return Column(
              children: <Widget>[
                Text(
                  'Products',
                  style: Theme.of(context).primaryTextTheme.headline6,
                ),
                Card(
                    child: Image.network(
                  snapshot.data[0].imageUrl,
                  height: 250,
                  errorBuilder: (ctx, error, stackTrace) => Text(
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

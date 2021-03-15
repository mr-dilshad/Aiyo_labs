import 'package:aiyo/UI/subcategory_screen.dart';
import 'package:aiyo/bloc/inventory_bloc.dart';
import 'package:aiyo/models/categories_model.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final String title;

  HomeScreen({this.title});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  initState() {
    super.initState();
    bloc.fetchAllCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StreamBuilder(
        stream: bloc.allCategories,
        builder: (context, AsyncSnapshot<List<CategoriesModel>> snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: <Widget>[
                Text(
                  'Categories',
                  style: Theme.of(context).primaryTextTheme.headline6,
                ),
                Expanded(child: _buildCategoriesGrid(snapshot))
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

  Widget _buildCategoriesGrid(AsyncSnapshot<List<CategoriesModel>> categories) {
    print('\n\n\n $categories.data');
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, crossAxisSpacing: 5.0),
        itemCount: categories.data.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        SubCategoryScreen(categories: categories.data))),
            child: Card(
              child: GridTile(
                child: Image.network(categories.data[index].banner,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Text(error.toString(), overflow: TextOverflow.ellipsis,),),
                footer: Text(categories.data[index].category_name),
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:aiyo/UI/subcategory_screen.dart';
import 'package:aiyo/bloc/inventory_bloc.dart';
import 'package:aiyo/models/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:emojis/emojis.dart';

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
        leading: Icon(Icons.sort),
        title: Text(widget.title),
        actions: [Icon(Icons.search),
        SizedBox(width:5)],
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: bloc.allCategories,
        builder: (context, AsyncSnapshot<List<CategoriesModel>> snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Categories',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.black, fontFamily: "Montserrat"),
                  ),
                  Expanded(child: _buildCategoriesGrid(snapshot))
                ],
              ),
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
              margin: EdgeInsets.all(10),
              child: GridTile(
                child: Image.network(
                  categories.data[index].banner,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Center(
                    child: Text(
                      Emojis.crossMark,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                footer: Text(categories.data[index].categoryName, overflow: TextOverflow.ellipsis,),
              ),
            ),
          );
        },
      ),
    );
  }
}

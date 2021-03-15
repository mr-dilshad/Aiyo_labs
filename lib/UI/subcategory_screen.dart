import 'package:aiyo/UI/product_screen.dart';
import 'package:aiyo/models/categories_model.dart';
import 'package:flutter/material.dart';

class SubCategoryScreen extends StatefulWidget {
  final List<CategoriesModel> categories;

  SubCategoryScreen({this.categories});
  @override
  _SubCategoryScreenState createState() => _SubCategoryScreenState();
}

class _SubCategoryScreenState extends State<SubCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    final tab = TabBar(
        isScrollable: true,
        tabs: List.generate(
            widget.categories.length,
            (index) => Tab(
                  text: widget.categories[index].category_name,
                )));
    return DefaultTabController(
      length: widget.categories.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Subcategories'),
          bottom: tab,
        ),
        body: TabBarView(
          children: List<Widget>.generate(
              widget.categories.length,
              (index) =>
                  _buildSubcategory(widget.categories[index].subcategory)),
        ),
      ),
    );
  }

  Widget _buildSubcategory(List<SubCategoryModel> sub_categories) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemCount: sub_categories.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProductScreen(
                        categoryId: sub_categories[index].category,
                        subCategoryId: sub_categories[index].sub_category_id,
                        categoryName: sub_categories[index].sub_category_name,
                      ))),
          child: Card(
            child: GridTile(
              child: Image.network(
                sub_categories[index].banner,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Text(
                  error.toString(),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              footer: Text(sub_categories[index].sub_category_name),
            ),
          ),
        ),
      ),
    );
  }
}

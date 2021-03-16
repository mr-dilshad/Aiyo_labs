import 'package:emojis/emojis.dart';
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
                  text: widget.categories[index].categoryName,
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

  Widget _buildSubcategory(List<SubCategoryModel> subCategories) {
    print(subCategories[0].banner);
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemCount: subCategories.length,
        itemBuilder: (context, index) => GestureDetector(
          // onTap: () => Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => ProductScreen(
          //               categoryId: subCategories[index].category,
          //               subCategoryId: subCategories[index].subCategoryId,
          //               categoryName: subCategories[index].subCategoryName,
          //             ))),
          onTap: () {},
          child: Card(
            margin: EdgeInsets.all(8.0),
            child: GridTile(
              child: Image.network(
                subCategories[index].banner,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>  Center(
                    child: Text(
                      Emojis.crossMark,
                    ),
                  ),
                ),
                footer: Text(subCategories[index].subCategoryName, overflow: TextOverflow.ellipsis,),
              ),
              
            ),
          ),
        ),
      );
  }
}

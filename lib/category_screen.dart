import 'package:flutter/material.dart';
import './category_item.dart';
import './dummy_dart.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:GridView(
          padding: EdgeInsets.all(15),
            gridDelegate:SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 3/2,

            ),
            children: DUMMY_CATEGORIES.map((data) => CategoryItem(data.title,data.color,data.id)).toList()
        ));
  }
}

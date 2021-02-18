import 'package:flutter/material.dart';
import 'package:meal_app/meals.dart';
import 'package:meal_app/meals_item.dart';
import './dummy_dart.dart';

class CategoryMealsScreen extends StatelessWidget {
  //final String id;
  //final String categorytitle;
  //CategoryMealsScreen(this.id,this.categorytitle);
  final List<Meal>availablemeals;
  CategoryMealsScreen(this.availablemeals);
  @override
  Widget build(BuildContext context) {
    final Modalargs=ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categorytitle=Modalargs['title'];
    final id=Modalargs['id'];
    final categories=availablemeals.where((element) {
      return element.categories.contains(id);
    }
    ).toList();
    return Scaffold(
      appBar: AppBar(title: Text(categorytitle),),
      body: ListView.builder(itemBuilder: (ctx,index){
        return MealsItem(title:categories[index].title,
          imageUrl:categories[index].imageUrl,
            duration:categories[index].duration,
            complexity:categories[index].complexity,
            affordability:categories[index].affordability,
          id:categories[index].id,



        );

      },itemCount: categories.length,)
    );
  }
}

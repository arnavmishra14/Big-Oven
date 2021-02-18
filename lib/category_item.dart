import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/category_meals_screen.dart';
import 'package:meal_app/category_screen.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  final String id;

  CategoryItem(this.title,this.color,this.id);

  void selectCategory(BuildContext ctx){
    Navigator.of(ctx).pushNamed('/category_meals',arguments: {
      'id':id,
      'title':title,

    });

  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        return selectCategory(context);

      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),

      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(title,style: Theme.of(context).textTheme.title,),
        decoration: BoxDecoration(
          gradient:LinearGradient(colors:[color,color.withOpacity(0.7)],begin: Alignment.topLeft,end:Alignment.bottomRight),
          borderRadius: BorderRadius.circular(15),

        ),

      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/category_meals_screen.dart';
import 'package:meal_app/dummy_dart.dart';
import 'package:meal_app/filters_screen.dart';
import 'package:meal_app/meals.dart';
import 'package:meal_app/meals_item_screen.dart';
import 'package:meal_app/tabs_screen.dart';
import './category_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget{
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String,bool> filters= {
  'gluten':false,
    'lactose':false,
    'vegan':false,
    'vegetarian':false,


};
  List<Meal> availablemeals=DUMMY_MEALS;
  void setfilters(Map<String,bool>filterdata){
    setState(() {
      filters=filterdata;
      availablemeals=DUMMY_MEALS.where((meal) {
        if(filters['gluten'] && !meal.isGlutenFree){
          return false;
        };
        if(filters['lactose'] && !meal.isLactoseFree){
          return false;
        };
        if(filters['vegan'] && !meal.isVegan){
          return false;
        };
        if(filters['vegetarian'] && !meal.isVegetarian){
          return false;
        };
        return true;
      }).toList();
    });

  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          title: TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          )
          )
        ),
        //home: TabsScreen(),
          initialRoute: '/',
      routes: {

        '/':(ctx){
          return TabsScreen();},

        '/category_meals':(ctx){
          return CategoryMealsScreen(availablemeals);

        },
        '/meals_item_screen':(ctx){
          return MealsItemScreen();

        },
        '/filters_screen':(ctx)=>FiltersScreen(filters,setfilters),
      },
      );


  }
}


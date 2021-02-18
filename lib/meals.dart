import 'package:flutter/material.dart';
enum Complexity{
  Simple,
  Challenging,
  Hard,
}
enum Affordability{
  Affordable,
  Pricey,
  Luxurious,
}
class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> steps;
  final List<String> ingredients;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isVegan;
  final bool isVegetarian;
  final bool isLactoseFree;

 const Meal({this.id, this.categories, this.affordability, this.complexity,
      this.title, this.duration, this.imageUrl, this.ingredients, this.isGlutenFree,
      this.isLactoseFree, this.isVegan, this.isVegetarian, this.steps});


}
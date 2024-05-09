import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Category extends Equatable {
  final int id;
  final String name;
  final Image image;

  Category({
    required this.id,
    required this.name,
    required this.image,
  });

  @override
  List<Object?> get props => [id, name, image];

  static List<Category> categories = [
    Category(
      id: 1,
      name: 'Coffee',
      image: Image.asset('assets/coffee_icon.png'),
    ),
    Category(
      id: 2,
      name: 'Tea',
      image: Image.asset('assets/tea_icon.png'),
    ),
    Category(
      id: 3,
      name: 'Dessert',
      image: Image.asset('assets/dessert_icon.png'),
    ),
    Category(
      id: 4,
      name: 'Breakfast',
      image: Image.asset('assets/breakfast_icon.png'),
    ),
    Category(
      id: 5,
      name: 'Drinks',
      image: Image.asset('assets/drinks_icon.png'),
    ),
  ];
}

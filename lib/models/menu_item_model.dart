import 'package:equatable/equatable.dart';

class MenuItem extends Equatable {
  final int id;
  final int restaurantId;
  final String name;
  final String category;
  final String description;
  final double price;

  MenuItem({
    required this.id,
    required this.restaurantId,
    required this.name,
    required this.category,
    required this.description,
    required this.price,
  });

  @override
  List<Object?> get props => [
    id,
    restaurantId,
    name,
    category,
    description,
    price,
  ];

  static List<MenuItem> menuItems = [
    MenuItem(
        id: 1,
        restaurantId: 1,
        name: 'Latte',
        category: 'Coffee',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus a sem vel ex eleifend faucibus.',
        price: 20,
    ),
    MenuItem(
        id: 2,
        restaurantId: 4,
        name: 'Cheescake',
        category: 'Dessert',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus a sem vel ex eleifend faucibus.',
        price: 25,
    ),
    MenuItem(
        id: 3,
        restaurantId: 3,
        name: 'Puer',
        category: 'Tea',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus a sem vel ex eleifend faucibus.',
        price: 30,
    ),
    MenuItem(
        id: 4,
        restaurantId: 1,
        name: 'English breakfast',
        category: 'Breakfast',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus a sem vel ex eleifend faucibus.',
        price: 60,
    ),
    MenuItem(
        id: 5,
        restaurantId: 2,
        name: 'Moxito',
        category: 'Drinks',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus a sem vel ex eleifend faucibus.',
        price: 30,
    ),
  ];
}

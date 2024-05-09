import 'package:equatable/equatable.dart';

import 'models.dart';

class Restaurant extends Equatable {
  final int id;
  final String imageUrl;
  final String name;
  final List<String> tags;
  final List<MenuItem> menuItems;
  final int deliveryTime;
  final String priceCategory;
  final double deliveryFee;
  final double distance;

  Restaurant({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.tags,
    required this.menuItems,
    required this.deliveryTime,
    required this.priceCategory,
    required this.deliveryFee,
    required this.distance
  });

  @override
  List<Object?> get props => [
    id,
    imageUrl,
    name,
    tags,
    deliveryTime,
    priceCategory,
    deliveryFee,
    distance
  ];

  static List<Restaurant> restaurants = [
    Restaurant(
      id: 1,
      name: 'Lvivsky kruasany',
      imageUrl: 'https://images.unsplash.com/photo-1559925393-8be0ec4767c8?q=80&w=1471&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      tags: MenuItem.menuItems
        .where((menuItem) => menuItem.restaurantId == 1)
        .map((menuItem) => menuItem.category)
        .toSet()
        .toList(),
      menuItems: MenuItem.menuItems
          .where((menuItem) => menuItem.restaurantId == 1)
          .toList(),
      deliveryTime: 30,
      priceCategory: '\$',
      deliveryFee: 2.99,
      distance: 0.1,
    ),
    Restaurant(
      id: 2,
      name: 'Ozzy Cafe',
      imageUrl: 'https://images.unsplash.com/photo-1463797221720-6b07e6426c24?q=80&w=1471&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      tags: MenuItem.menuItems
          .where((menuItem) => menuItem.restaurantId == 2)
          .map((menuItem) => menuItem.category)
          .toSet()
          .toList(),
      menuItems: MenuItem.menuItems
          .where((menuItem) => menuItem.restaurantId == 2)
          .toList(),
      deliveryTime: 30,
      priceCategory: '\$',
      deliveryFee: 2.99,
      distance: 0.1,
    ),
    Restaurant(
      id: 3,
      name: 'Black Coffee',
      imageUrl: 'https://images.unsplash.com/photo-1542181961-9590d0c79dab?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      tags: MenuItem.menuItems
          .where((menuItem) => menuItem.restaurantId == 3)
          .map((menuItem) => menuItem.category)
          .toSet()
          .toList(),
      menuItems: MenuItem.menuItems
          .where((menuItem) => menuItem.restaurantId == 3)
          .toList(),
      deliveryTime: 30,
      priceCategory: '\$',
      deliveryFee: 2.99,
      distance: 0.1,
    ),
    Restaurant(
      id: 4,
      name: 'Buco',
      imageUrl: 'https://images.unsplash.com/photo-1555396273-367ea4eb4db5?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      tags: MenuItem.menuItems
          .where((menuItem) => menuItem.restaurantId == 4)
          .map((menuItem) => menuItem.category)
          .toSet()
          .toList(),
      menuItems: MenuItem.menuItems
          .where((menuItem) => menuItem.restaurantId == 4)
          .toList(),
      deliveryTime: 30,
      priceCategory: '\$',
      deliveryFee: 2.99,
      distance: 0.1,
    ),
    Restaurant(
      id: 5,
      name: 'Bruno',
      imageUrl: 'https://images.unsplash.com/photo-1600093463592-8e36ae95ef56?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      tags: MenuItem.menuItems
          .where((menuItem) => menuItem.restaurantId == 5)
          .map((menuItem) => menuItem.category)
          .toSet()
          .toList(),
      menuItems: MenuItem.menuItems
          .where((menuItem) => menuItem.restaurantId == 5)
          .toList(),
      deliveryTime: 30,
      priceCategory: '\$',
      deliveryFee: 2.99,
      distance: 0.1,
    ),
  ];

}
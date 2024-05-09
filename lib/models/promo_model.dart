import 'package:equatable/equatable.dart';

class Promo extends Equatable {
  final int id;
  final String title;
  final String description;
  final String imageUrl;

  Promo({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    imageUrl,
  ];

  static List<Promo> promos = [
    Promo(
        id: 1,
        title: 'FREE Delivery on Your First 3 Orders',
        description: 'Place an order of \$10 or more and the delivery fee is on us',
        imageUrl: 'https://images.unsplash.com/photo-1513530176992-0cf39c4cbed4?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8MjJ8fHxlbnwwfHx8fHw%3D'
    ),
    Promo(
        id: 2,
        title: '20% off on Selected Restaurant',
        description: 'Get a discount at more than 200+ restaurant',
        imageUrl: 'https://images.unsplash.com/photo-1567941723610-db0bcb4cca67?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NjR8fGRlc3NlcnR8ZW58MHx8MHx8fDA%3D'
    ),
  ];

}

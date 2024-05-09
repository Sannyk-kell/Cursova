import 'package:flutter/material.dart';
import 'package:cursova/models/models.dart';

import 'widgets.dart';

class RestaurantInformation extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantInformation({
    super.key,
    required this.restaurant,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            restaurant.name,
            style: Theme.of(context).textTheme.headline3!.copyWith(
              color: Theme.of(context).primaryColor,
            ),
          ),
          SizedBox(height: 10),
          RestaurantTags(restaurant: restaurant),
          SizedBox(height: 5),
          Text(
            '${restaurant.distance}km away - \$${restaurant.deliveryFee} delivery fee',
            style: Theme.of(context).textTheme.headline4!.copyWith(
              color: Theme.of(context).primaryColor,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Restaurant Information',
            style: Theme.of(context).textTheme.headline5,
          ),
          SizedBox(height: 5),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus a sem vel ex eleifend faucibus. Phasellus non felis volutpat, rhoncus purus ut, viverra libero. Vivamus dictum justo eget malesuada malesuada. Praesent egestas leo at ipsum commodo, sit amet commodo nibh tempor. Aliquam efficitur vulputate ex, in efficitur ligula lacinia ac. Etiam eu laoreet elit. ',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}

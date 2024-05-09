import 'package:flutter/material.dart';

import '../models/models.dart';

class RestaurantTags extends StatelessWidget {
  const RestaurantTags({
    super.key,
    required this.restaurant,
  });

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: restaurant.tags
          .map(
            (tag) => restaurant.tags.indexOf(tag) ==
            restaurant.tags.length - 1
            ? Text(
          tag,
          style: Theme.of(context).textTheme.bodyText1,
        )
            : Text(
          '$tag, ',
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ).toList(),
    );
  }
}

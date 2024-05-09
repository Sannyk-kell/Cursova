import 'package:cursova/models/restaurant_model.dart';
import 'package:flutter/material.dart';
import 'package:cursova/models/models.dart';

import '../../widgets/widgets.dart';


class RestaurantDetailsScreen extends StatelessWidget {
  static const String routeName = '/restaurant-details';

  static Route route({required Restaurant restaurant}) {
    return MaterialPageRoute(
      builder: (_) => RestaurantDetailsScreen(restaurant: restaurant),
      settings: RouteSettings(name: routeName),
    );
  }

  final Restaurant restaurant;

  const RestaurantDetailsScreen({
    required this.restaurant,
  });

  @override
  Widget build(BuildContext context) {
    Restaurant restaurant = Restaurant.restaurants[0];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/basket');
                  },
                  child: Text(
                      'Basket'
                  ),
              ),
            ],
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                    bottom: Radius.elliptical(
                      MediaQuery.of(context).size.width, 50
                    ),
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      restaurant.imageUrl
                  )
                )
              ),
            ),
            RestaurantInformation(restaurant: restaurant),
            ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount:  restaurant.tags.length,
                itemBuilder: (context, index) {
                  return _buildMenuItems(restaurant, context, index);
                },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItems(Restaurant restaurant, BuildContext context, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
              restaurant.tags[index],
              style: Theme.of(context).textTheme.headline3!.copyWith(
                color: Theme.of(context).primaryColor,
              ),
          ),
        ),
        Column(
          children: restaurant.menuItems
              .where((menuItem) => menuItem.category == restaurant.tags[index])
              .map(
                  (menuItem) => Column(
                    children: [
                      Container(
                        color: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: ListTile(
                          dense: true,
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            menuItem.name,
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          subtitle: Text(
                            menuItem.description,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          trailing: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('\$${menuItem.price}',
                                style: Theme.of(context).textTheme.bodyText1,),
                              IconButton(
                                  icon: Icon(
                                      Icons.add_circle,
                                      color: Theme.of(context).primaryColor,
                                  ),
                                  onPressed: () {},
                              )
                            ],
                          ),
                        ),
                      ),
                      Divider(height: 2,),
                    ],
                ),
            )
          .toList(),
          ),
      ],
    );
  }

}

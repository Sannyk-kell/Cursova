import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/filters/filters_bloc.dart';
import '../../models/models.dart';
import '../../models/price_model.dart';
import '../../widgets/widgets.dart';

class FilterScreen extends StatelessWidget {
  static const String routeName = '/filter';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => FilterScreen(),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Filter")),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<FiltersBloc, FiltersState>(
                builder: (context, state) {
                  if (state is FiltersLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is FiltersLoaded) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50,
                        ),
                      ),
                      child: Text(
                          'Apply'
                      ),
                      onPressed: () {
                        var categories = state.filter.categoryFilters
                            .where((filter) => filter.value)
                            .map((filter) => filter.category.name)
                            .toList();

                        var prices = state.filter.priceFilters
                            .where((filter) => filter.value)
                            .map((filter) => filter.price.price)
                            .toList();

                        List<Restaurant> restaurants = Restaurant.restaurants
                          .where((restaurant) => categories.any(
                                (category) => restaurant.tags.contains(category),
                              ),
                            )
                            .where((restaurant) => prices.any(
                              (price) => restaurant.priceCategory.contains(price),
                              ),
                            )
                          .toList();

                        Navigator.pushNamed(
                          context,
                          '/restaurant-listing',
                          arguments: restaurants,
                          );
                        },
                    );
                  }
                  else {return Text('Something went wrong');}
                },
              ),
              ],
            ),
          ),
        ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              'Price',
              style: Theme.of(context).textTheme.headline4!.copyWith(
                color: Theme.of(context).primaryColor,
              ),
            ),
            CustomPriceFilter(),
            Text(
              'Category',
              style: Theme.of(context).textTheme.headline4!.copyWith(
                color: Theme.of(context).primaryColor,
              ),
            ),
            CustomCategoryFilter(),
          ],
        ),
      )
    );
  }
}







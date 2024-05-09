import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/filters/filters_bloc.dart';
import '../models/models.dart';

class CustomPriceFilter extends StatelessWidget {
  const CustomPriceFilter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FiltersBloc, FiltersState>(
      builder: (context, state) {
        if(state is FiltersLoading){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if(state is FiltersLoaded){
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: state.filter.priceFilters
                .asMap()
                .entries
                .map(
                  (price) => InkWell(
                onTap: () {
                  context.read<FiltersBloc>().add(
                    PriceFilterUpdated(
                      priceFilter: state.filter.priceFilters[price.key]
                          .copyWith(
                        value: !state.filter
                            .priceFilters[price.key].value,),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: state.filter.priceFilters[price.key].value
                        ? Theme.of(context).primaryColor.withAlpha(100)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    state.filter.priceFilters[price.key].price.price,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
              ),
            )
                .toList(),
          );
        }
        else{
          return const Text('Something went wrong.');
        }
      },
    );
  }
}
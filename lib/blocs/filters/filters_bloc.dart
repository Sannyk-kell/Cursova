import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../models/models.dart';
import '../../models/price_filter_model.dart';

part 'filters_event.dart';
part 'filters_state.dart';

class FiltersBloc extends Bloc<FiltersEvent, FiltersState> {
  FiltersBloc() : super(FiltersLoading()) {
    on<FilterLoad>((event, emit) async {
      emit(FiltersLoaded(filter: Filter(
        categoryFilters: CategoryFilter.filters,
        priceFilters: PriceFilter.filters,
      ),));
    });

    on<CategoryFilterUpdated>((event, emit) {
      if (state is FiltersLoaded) {
        final FiltersLoaded loadedState = state as FiltersLoaded;
        final List<CategoryFilter> updatedCategoryFilters =
        loadedState.filter.categoryFilters.map((categoryFilter) {
          return categoryFilter.id == event.categoryFilter.id
              ? event.categoryFilter
              : categoryFilter;
        }).toList();

        emit(FiltersLoaded(
          filter: Filter(
            categoryFilters: updatedCategoryFilters,
            priceFilters: loadedState.filter.priceFilters,
          ),
        ));
      }
    });

    on<PriceFilterUpdated>((event, emit) {
      if (state is FiltersLoaded) {
        final FiltersLoaded loadedState = state as FiltersLoaded;
        final List<PriceFilter> updatedPriceFilters =
        loadedState.filter.priceFilters.map((priceFilter) {
          return priceFilter.id == event.priceFilter.id
              ? event.priceFilter
              : priceFilter;
        }).toList();

        emit(FiltersLoaded(
          filter: Filter(
            categoryFilters: loadedState.filter.categoryFilters,
            priceFilters: updatedPriceFilters,
          ),
        ));
      }
    });

  }


  @override
  Stream<FiltersState> mapEventToState(
      FiltersEvent event,
      ) async* {
    if(event is FilterLoad){
      yield* _mapFilterLoadToState();
    }
    if(event is CategoryFilterUpdated) {
      yield* _mapCategoryFilterUpdateToState(event, state);
    }
    if(event is PriceFilterUpdated){
      yield* _mapPriceFilterUpdateToState(event, state);
    }
  }

  Stream<FiltersState> _mapFilterLoadToState() async* {
    yield FiltersLoaded(
      filter: Filter(
        categoryFilters: CategoryFilter.filters,
        priceFilters: PriceFilter.filters,
      ),
    );
  }

  Stream<FiltersState> _mapCategoryFilterUpdateToState(
      CategoryFilterUpdated event,
      FiltersState state,
      ) async*{
    if (state is FiltersLoaded) {
      final List<CategoryFilter> updatedCategoryFilters =
      state.filter.categoryFilters.map((categoryFilter) {
        return categoryFilter.id == event.categoryFilter.id
            ? event.categoryFilter
            : categoryFilter;
      }).toList();
      yield FiltersLoaded(
        filter: Filter(
          categoryFilters:  updatedCategoryFilters,
          priceFilters: state.filter.priceFilters,
        ),
      );
    }
  }

  Stream<FiltersState> _mapPriceFilterUpdateToState(
      PriceFilterUpdated event,
      FiltersState state,
      ) async* {
    if (state is FiltersLoaded) {
      final List<PriceFilter> updatedPriceFilters =
      state.filter.priceFilters.map((priceFilter) {
        return priceFilter.id == event.priceFilter.id
            ? event.priceFilter
            : priceFilter;
      }).toList();
      yield FiltersLoaded(
        filter: Filter(
          categoryFilters: state.filter.categoryFilters,
          priceFilters: updatedPriceFilters,
        ),
      );
    }
  }



}
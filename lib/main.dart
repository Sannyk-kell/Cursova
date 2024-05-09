import 'package:cursova/blocs/basket/basket_bloc.dart';
import 'package:cursova/blocs/filters/filters_bloc.dart';
import 'package:cursova/config/app_router.dart';
import 'package:cursova/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/theme.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => FiltersBloc()
              ..add(
                FilterLoad(),
              )
        ),
        BlocProvider(
            create: (context) => BasketBloc()
              ..add(
                StartBasket(),
              )
        ),
        BlocProvider(
            create: (context) => BasketBloc()
                ..add(
                  StartBasket(),
                )
        ),
      ],
      child: MaterialApp(
        title: 'Delivery',
        theme: theme(),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: HomeScreen.routeName,
      ),
    );
  }
}

import 'package:cursova/blocs/basket/basket_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BasketScreen extends StatelessWidget {
  static const String routeName = '/basket';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => BasketScreen(),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Basket"),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.edit)
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  shape: RoundedRectangleBorder(),
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                onPressed: () {

                },
                child: Text(
                    'Go To Checkout'
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Cutlery',
                style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: Theme.of(context).primaryColor),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                padding: const EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                          'Do you need cutlery?',
                          style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    BlocBuilder<BasketBloc, BasketState>(
                    builder: (context, state) {
                      if (state is BasketLoading) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      else if (state is BasketLoaded) {
                        return SizedBox(
                          width: 100,
                          child: Switch(
                            value: state.basket.cutlery,
                            onChanged: (bool? newValue) {
                              context.read<BasketBloc>().add(ToggleSwitch());
                            },
                          ),
                        );
                      } else {
                        return Text('Something went wrong');
                      }
                    },
                  )
                  ],
                ),
              ),
              Text(
                'Items',
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: Theme.of(context).primaryColor),
              ),
              BlocBuilder<BasketBloc, BasketState>(
              builder: (context, state) {
                if (state is BasketLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is BasketLoaded) {
                  return state.basket.items.length == 0
                    ? Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(top: 5),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)
                        ),
                      child: Row(
                        children: [
                          Text(
                              'No Items in the Basket',
                              textAlign: TextAlign.left,
                              style: Theme.of(context).textTheme.headline6,
                          )
                        ],
                      ),
                      )
                    : ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.basket
                          .itemQuantity(state.basket.items)
                          .keys
                          .length,
                      itemBuilder: (context, index) {
                        return Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(top: 5),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Row(
                            children: [
                              Text(
                                '${state.basket.itemQuantity(state.basket.items).entries.elementAt(index).value}x',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(color: Theme.of(context).primaryColor),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Text(
                                '${state.basket.itemQuantity(state.basket.items).keys.elementAt(index).name}',
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                              ),
                              Text(
                                '\$${state.basket.itemQuantity(state.basket.items).keys.elementAt(index).price}',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ],
                          ),
                        );
                      }
                  );
                } else {return Text('Something went wrong');}
              },
            ),
              Container(
                width: double.infinity,
                height: 100,
                margin: const EdgeInsets.only(top: 5),
                padding: const EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  SvgPicture.asset(
                      'assets/delivery.svg',
                      height: 100,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 20),
                      Text(
                        'Delivery in 20 minutes',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text (
                            'Change',
                            style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(color: Theme.of(context).primaryColor),
                          )
                      )
                    ],
                  )
                ],),
              ),
              Container(
                width: double.infinity,
                height: 100,
                margin: const EdgeInsets.only(top: 5),
                padding: const EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 20),
                        Text(
                          'Do you have a voucher?',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text (
                              'Apply',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(color: Theme.of(context).primaryColor),
                            )
                        )
                      ],
                    ),
                    SvgPicture.asset(
                      'assets/voucher.svg',
                      height: 100,
                    ),
                  ],),
              ),
              Container(
                width: double.infinity,
                height: 100,
                margin: const EdgeInsets.only(top: 5),
                padding: const EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Subtotal',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          Text(
                            '\$20.0',
                            style: Theme.of(context).textTheme.headline6,
                          )
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Delivery Fee',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          Text(
                            '\$5.0',
                            style: Theme.of(context).textTheme.headline6,
                          )
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(color: Theme.of(context).primaryColor),
                          ),
                          Text(
                            '\$25.0',
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(color: Theme.of(context).primaryColor),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}

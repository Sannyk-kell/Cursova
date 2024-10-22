import 'package:flutter/material.dart';

class DeliveryTimeScreen extends StatelessWidget {
  static const String routeName = '/delivery-time';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => DeliveryTimeScreen(),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Delivery Time")),
      body: Center(
        child: ElevatedButton(child: Text('Home'),
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },),
      ),
    );
  }
}

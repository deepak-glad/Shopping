import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/cart.dart' show Cart;
import '../widgets/cart_items.dart';
import '../provider/order_provider.dart' show Orders;

class Order extends StatelessWidget {
  static const routeName = '/cart-screen';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Theme.of(context).canvasColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'CART',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
              RaisedButton(
                onPressed: () {
                  Provider.of<Orders>(context, listen: false)
                      .addOrder(cart.items.values.toList(), cart.totalAmount);
                  cart.clear();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('successfully ordered'),
                    backgroundColor: Theme.of(context).errorColor,
                    duration: Duration(seconds: 3),
                  ));
                },
                child: Text(
                  'ORDER NOW',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Card(
              color: Colors.grey[300],
              margin: EdgeInsets.all(15),
              child: Padding(
                padding: EdgeInsets.all(18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Chip(
                      label: Text(
                        '\₹ ${cart.totalAmount.toStringAsFixed(2)}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                      backgroundColor: Theme.of(context).canvasColor,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: cart.itemCount,
                itemBuilder: (ctx, index) => OrderItems(
                  cart.items.values.toList()[index].id,
                  cart.items.keys.toList()[index],
                  cart.items.values.toList()[index].price,
                  cart.items.values.toList()[index].title,
                  cart.items.values.toList()[index].quantity,
                ),
              ),
            )
          ],
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:shopping_app/provider/cart.dart';
import 'package:provider/provider.dart';
import '../provider/cart.dart';

class OrderItems extends StatelessWidget {
  final String id;
  final String productId;
  final String title;
  final double price;
  final int quantity;

  OrderItems(this.id, this.productId, this.price, this.title, this.quantity);
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(productId);
      },
      key: ValueKey(id),
      background: Container(
          child: Icon(
            Icons.delete,
            size: 40,
            color: Colors.white,
          ),
          alignment: Alignment.centerRight,
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 4,
          ),
          color: Theme.of(context).errorColor),
      child: Card(
        margin: EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 4,
        ),
        child: Padding(
            padding: EdgeInsets.all(8),
            child: ListTile(
              leading: Text('\$${price.toStringAsFixed(2)}'),
              title: Text(title),
              subtitle:
                  Text('Total \$${(price * quantity).toStringAsFixed(2)}'),
              trailing: Text('\$$quantity x'),
            )),
      ),
    );
  }
}

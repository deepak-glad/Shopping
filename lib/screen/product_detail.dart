import 'package:flutter/material.dart';
import 'package:shopping_app/provider/Product_provider.dart';
import 'package:provider/provider.dart';

class ProductDetail extends StatelessWidget {
  static const routeName = '/product-detail';
  @override
  Widget build(BuildContext context) {
    final productId =
        ModalRoute.of(context).settings.arguments as String; // is the id!
    final loadedProduct = Provider.of<ProductProvider>(context, listen: false)
        .findById(productId);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          loadedProduct.id,
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Theme.of(context).canvasColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 500,
              width: 500,
              child: Image.network(
                loadedProduct.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  loadedProduct.title,
                  style: TextStyle(
                      fontSize: 25,
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  // loadedProduct.price.toString(),
                  '\$${loadedProduct.price}',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            Text(
              loadedProduct.description,
              style:
                  TextStyle(fontSize: 25, color: Theme.of(context).accentColor),
            ),
            // Text(loadedProduct.id),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/product.dart';
import '../provider/cart.dart';
import 'package:shopping_app/screen/product_detail.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    // print('fav');
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(
            ProductDetail.routeName,
            arguments: product.id,
          );
        },
        child: GridTile(
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
          footer: GridTileBar(
            title: Text(product.title),
            // leading: Consumer<Product>(
            //   builder: (ctx, product, _) => FavoriteButton(
            //     valueChanged: (_isFavorite) {
            //       print('Is Favorite $_isFavorite)');
            //       product.toggleFavoriteStatus();
            //     },
            //   ),
            // ),
            leading: Consumer<Product>(
              builder: (ctx, product, _) => IconButton(
                icon: Icon(
                  product.isFavorite ? Icons.favorite : Icons.favorite_border,
                ),
                color: Colors.red,
                onPressed: () {
                  product.toggleFavoriteStatus();
                },
              ),
            ),
            backgroundColor: Colors.black54,
            trailing: IconButton(
              icon: Icon(Icons.shopping_cart),
              // color: Theme.of(context).buttonTheme.colorScheme.surface,
              onPressed: () {
                cart.addItem(product.id, product.price, product.title);
              },
            ),
          ),
        ),
      ),
    );
  }
}

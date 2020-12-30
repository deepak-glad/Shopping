import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/provider/favorite.dart';
import '../provider/product.dart';
import '../provider/cart.dart';
import 'package:shopping_app/screen/product_detail.dart';

class ProductItem extends StatelessWidget {
  final String image;
  final String name;
  final int price;
  final String id;
  ProductItem(this.image, this.name, this.price, this.id);
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    final fav = Provider.of<FavoritePage>(context, listen: false);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          ProductDetail.routeName,
          arguments: id,
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.white70, width: 1),
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 10,
        child: GridTile(
          child: Image.network(
            image,
            fit: BoxFit.cover,
          ),
          footer: GridTileBar(
            title: Text(name),
            // leading: Consumer<Product>(
            //   builder: (ctx, product, _) => FavoriteButton(
            //     valueChanged: (_isFavorite) {
            //       print('Is Favorite $_isFavorite)');
            //       product.toggleFavoriteStatus();
            //     },
            //   ),
            // ),
            // leading: Consumer<Product>(
            //   builder: (ctx, product, _) => IconButton(
            //     icon: Icon(
            //       product.isFavorite ? Icons.favorite : Icons.favorite_border,
            //     ),
            //     color: Colors.red,
            //     onPressed: () {
            //       product.toggleFavoriteStatus();
            //     },
            //   ),
            // ),
            leading: IconButton(
                icon: Icon(Icons.favorite_sharp),
                onPressed: () {
                  fav.addItem(id, price.toDouble(), name, image);
                }),
            backgroundColor: Colors.black54,
            trailing: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                cart.addItem(id, price.toDouble(), name);
              },
            ),
          ),
        ),
      ),
    );
  }
}

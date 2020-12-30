import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/provider/favorite.dart';

class FavoriteScreen extends StatelessWidget {
  static const routeName = '/favorite-screen';
  @override
  Widget build(BuildContext context) {
    final ff = Provider.of<FavoritePage>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favorites',
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        backgroundColor: Theme.of(context).canvasColor,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [Text(ff.itemCount.toString()), Text(ff.map[1].id)],
      ),
    );
  }
}

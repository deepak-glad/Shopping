import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/provider/favorite.dart';

class FavoriteScreen extends StatefulWidget {
  static const routeName = '/favorite-screen';

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
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
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.75,
            crossAxisCount: 2,
          ),
          itemCount: ff.itemCount,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.only(top: 10, left: 10),
              elevation: 10,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.green, width: 1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Image.network(
                      ff.map.values.toList()[index].image,
                      fit: BoxFit.fill,
                      height: 150,
                      width: 155,
                      alignment: Alignment.bottomLeft,
                    ),
                    CircleAvatar(
                        backgroundColor: Colors.grey[300],
                        child: IconButton(
                            color: Colors.pink,
                            icon: Icon(Icons.close),
                            onPressed: () {
                              Provider.of<FavoritePage>(context, listen: false)
                                  .removeItem(ff.map.values.toList()[index].id);
                              ff.clear();
                            })),
                  ]),
                  SizedBox(height: 8),
                  Text(ff.map.values.toList()[index].title,
                      textAlign: TextAlign.center,
                      // overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text(
                    '₹ ${ff.map.values.toList()[index].price.toString()}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  // Divider(color: Colors.black),
                  FlatButton(
                    onPressed: () {},
                    child: Text(
                      'MOVE TO CHART',
                      style: TextStyle(color: Colors.pink),
                    ),
                    color: Colors.grey[300],
                  )
                ],
              ),
            );
          }),
    );
  }
}

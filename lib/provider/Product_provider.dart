import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:shopping_app/models/modell.dart';
import 'package:shopping_app/provider/product.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ProductProvider with ChangeNotifier {
  List<Product> _items = [
    // Product(
    //   id: '1',
    //   title: 'Red Shirt',
    //   description: 'A red shirt - it is pretty red!',
    //   price: 29.99,
    //   imageUrl:
    //       'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    // ),
    // Product(
    //   id: '2',
    //   title: 'Trousers',
    //   description: 'A nice pair of trousers.',
    //   price: 59.99,
    //   imageUrl:
    //       'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    // ),
    // Product(
    //   id: '3',
    //   title: 'Yellow Scarf',
    //   description: 'Warm and cozy - exactly what you need for the winter.',
    //   price: 19.99,
    //   imageUrl:
    //       'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    // ),
    // Product(
    //   id: '4',
    //   title: 'A Pan',
    //   description: 'Prepare any meal you want.',
    //   price: 49.99,
    //   imageUrl:
    //       'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    // ),
  ];

  var _showFavoritesOnly = false;

  List<Product> get items {
    if (_showFavoritesOnly) {
      return _items.where((prodItem) => prodItem.isFavorite).toList();
    }
    return [..._items];
  }

  void showAll() {
    _showFavoritesOnly = false;
    notifyListeners();
  }

  void favoritesOnly() {
    _showFavoritesOnly = true;
    notifyListeners();
  }

  // void _add() {
  //   // items.add(value);
  //   notifyListeners();
  // }
  Future<Welcome> getAnotherr() async {
    var nnewModel = null;
    const url =
        'https://shopping-b68f2-default-rtdb.firebaseio.com/product.json';

    try {
      final response = await http.get(url);

      // print(jsonDecode(response.body));
      if (response.statusCode == 200) {
        final jsonString = response.body;
        final jsonMap = jsonDecode(jsonString);
        nnewModel = Welcome.fromJson(jsonMap);
      }
    } catch (errr) {
      throw errr;
    }
    // print(nnewModel);
    return nnewModel;
  }

  Product findById(String id) {
    return _items.firstWhere(
      (prod) => prod.id == id,
    );
  }
}

import 'package:flutter/foundation.dart';

class FavoriteItem {
  final String id;
  final String title;
  // final int quantity;
  final double price;
  final String image;

  FavoriteItem({
    @required this.id,
    @required this.title,
    // @required this.quantity,
    @required this.price,
    @required this.image,
  });
}

class FavoritePage with ChangeNotifier {
  Map<String, FavoriteItem> _map = {};

  Map<String, FavoriteItem> get map {
    return {..._map};
  }

  int get itemCount {
    return _map.length;
  }

  void addItem(
    String productId,
    double price,
    String title,
    String image,
  ) {
    if (_map.containsKey(productId)) {
      // change quantity...
      _map.update(
        productId,
        (existingFavoriteItem) => FavoriteItem(
          id: existingFavoriteItem.id,
          title: existingFavoriteItem.title,
          price: existingFavoriteItem.price,
          // quantity: existingFavoriteItem.quantity + 1,
          image: existingFavoriteItem.image,
        ),
      );
    } else {
      _map.putIfAbsent(
        productId,
        () => FavoriteItem(
          id: DateTime.now().toString(),
          title: title,
          price: price,
          // quantity: 1,
          image: image,
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _map.remove(productId);
    notifyListeners();
  }

  void clear() {
    _map = {};
    notifyListeners();
  }
}

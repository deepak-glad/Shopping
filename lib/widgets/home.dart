import 'package:flutter/material.dart';

import 'package:shopping_app/widgets/product_overView.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProductOverview(),
    );
  }
}

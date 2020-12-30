import 'package:flutter/material.dart';
import 'package:shopping_app/models/modell.dart';
import 'package:shopping_app/models/product_items.dart';
import 'package:shopping_app/provider/Product_provider.dart';

class ProductOverview extends StatefulWidget {
  @override
  _ProductOverviewState createState() => _ProductOverviewState();
}

class _ProductOverviewState extends State<ProductOverview> {
  Future<Welcome> _newModel;
  Future<void> _newvalue;
  var _isInt = true;
  @override
  void didChangeDependencies() {
    if (_isInt) _newModel = ProductProvider().getAnotherr();
    _isInt = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amberAccent[100],
      // height: 100,
      width: double.infinity,
      child: FutureBuilder<Welcome>(
          future: _newModel,
          builder: (centex, snapshot) {
            if (snapshot.hasData)
              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1,
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                  ),
                  scrollDirection: Axis.vertical,
                  itemCount: snapshot.data.count,
                  itemBuilder: (context, index) {
                    var dd = snapshot.data.data[index];
                    return GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        // scrollDirection: Axis.vertical,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 1,
                          crossAxisCount: 1,
                          crossAxisSpacing: 4,
                        ),
                        shrinkWrap: true,
                        itemCount: dd.productCategories.length,
                        itemBuilder: (context, ind) {
                          var dt = snapshot
                              .data.data[index].productCategories[ind].category;
                          return ProductItem(
                            dt == null
                                ? 'https://cdn.pixabay.com/photo/2015/12/01/20/28/road-1072823_1280.jpg'
                                : dt.medium.url,
                            dd.name,
                            dd.productMrp,
                            dd.id,
                          );
                        });
                  });
            else
              return Center(child: CircularProgressIndicator());
          }),
    );
  }
}

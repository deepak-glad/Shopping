import 'package:flutter/material.dart';
import 'package:shopping_app/models/modell.dart';
import 'package:shopping_app/provider/Product_provider.dart';

class ProductDetail extends StatefulWidget {
  static const routeName = '/product-detail';

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  Future<Welcome> _newdata;

  @override
  void initState() {
    _newdata = ProductProvider().getAnotherr();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final productId =
        ModalRoute.of(context).settings.arguments as String; // is the id!
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            'Detail',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Theme.of(context).canvasColor,
        ),
        body: FutureBuilder<Welcome>(
          future: _newdata,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data.count,
                itemBuilder: (ctx, index) {
                  var dat = snapshot.data.data[index];
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: 1,
                      itemBuilder: (context, i) {
                        if (dat.id == productId)
                          return Container(
                            child: Column(
                              children: [
                                Container(
                                  child: Image.network(dat
                                              .productCategories[0].category !=
                                          null
                                      ? dat.productCategories[0].category.medium
                                          .url
                                      : 'https://cdn.pixabay.com/photo/2015/12/01/20/28/road-1072823_1280.jpg'),
                                ),
                                SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      dat.name,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '₹${dat.productMrp.toString()}',
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 18),
                                    ),
                                  ],
                                ),
                                Text(dat.description),
                                Text(dat.shortProductDescription)
                              ],
                            ),
                          );
                      });
                });
          },
        ));
  }
}

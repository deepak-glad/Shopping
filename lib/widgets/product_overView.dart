// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../provider/Product_provider.dart';
// import 'package:shopping_app/models/product_items.dart';

// class ProductOverview extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final productData = Provider.of<ProductProvider>(context);
//     final productss = productData.items;
//     return GridView.builder(
//       itemCount: productss.length,
//       itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
//           value: productss[i],
//           // create: (c) => productss[i],
//           child: ProductItem()),
//       // productss[i].id,
//       // productss[i].title,
//       // productss[i].imageUrl,
//       // productss[i].description,
//       // productss[i].isFavorite,
//       // ),
//       // ),
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         childAspectRatio: 3 / 2,
//         crossAxisCount: 2,
//         crossAxisSpacing: 1,
//       ),
//     );
//   }
// }
import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_app/models/model.dart';
import 'package:shopping_app/models/product_items.dart';

class ProductOverview extends StatefulWidget {
  @override
  _ProductOverviewState createState() => _ProductOverviewState();
}

class _ProductOverviewState extends State<ProductOverview> {
  Future<Welcome> fetchAlbum() async {
    var newModel = null;
    final response = await http.get(
      'http://204.48.26.50:7058/api/product/list',
      headers: {
        HttpHeaders.authorizationHeader:
            "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImFmYzI3NTRkLTg1MzAtNDRmZC1hZmFlLTNmMTg1ZjkzNzBhMiIsImlhdCI6MTYwODcyNzA4NzIxNX0.r9SeFyCv05OofPL20nuum8x7nak_eIo8aOBjw4qa9n8"
      },
    );
    print(response.statusCode);
    try {
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = jsonDecode(jsonString);
        newModel = Welcome.fromJson(jsonMap);
      }
    } catch (Exception) {
      return newModel;
    }
    return newModel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // color: Colors.yellow,
        // height: 100,
        width: double.infinity,
        child: FutureBuilder<Welcome>(
            future: fetchAlbum(),
            builder: (centex, snapshot) {
              print(snapshot.hasData);
              if (snapshot.hasData)
                return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 3 / 2,
                      crossAxisCount: 2,
                      crossAxisSpacing: 2,
                    ),
                    scrollDirection: Axis.vertical,
                    itemCount: snapshot.data.count,
                    itemBuilder: (context, index) {
                      var dd = snapshot.data.data[index];
                      return GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          // scrollDirection: Axis.vertical,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 3 / 2,
                            crossAxisCount: 1,
                            crossAxisSpacing: 2,
                          ),
                          shrinkWrap: true,
                          itemCount: dd.productCategories.length,
                          itemBuilder: (context, ind) {
                            var dt = snapshot.data.data[index]
                                .productCategories[ind].category;
                            return Row(children: [
                              Container(
                                color: Colors.amberAccent,
                                child: AspectRatio(
                                    aspectRatio: 1,
                                    child: Image.network(
                                      dt == null
                                          ? 'https://cdn.pixabay.com/photo/2015/12/01/20/28/road-1072823_1280.jpg'
                                          : dt.medium.url,
                                      fit: BoxFit.cover,
                                    )),
                              ),
                            ]);
                          });
                    });
              else
                return Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}
// Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Container(
//                                 color: Colors.cyan,
//                                 height: 100,
//                                 margin: const EdgeInsets.all(8),
//                                 child: Row(
//                                   children: [
//                                     Card(
//                                       clipBehavior: Clip.antiAlias,
//                                       shape: RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(30),
//                                       ),
//                                       child: AspectRatio(
//                                           aspectRatio: 1,
//                                           child: Image.network(
//                                             dt == null
//                                                 ? 'https://cdn.pixabay.com/photo/2015/12/01/20/28/road-1072823_1280.jpg'
//                                                 : dt.medium.url,
//                                             fit: BoxFit.cover,
//                                           )),
//                                     ),
//                                     SizedBox(width: 5),
//                                     Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceAround,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Container(
//                                           width: MediaQuery.of(context)
//                                                   .size
//                                                   .width -
//                                               150,
//                                           child: Text(
//                                             dd.name,
//                                             overflow: TextOverflow.fade,
//                                             style: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               fontSize: 15,
//                                             ),
//                                           ),
//                                         ),
//                                         Container(
//                                           width: MediaQuery.of(context)
//                                                   .size
//                                                   .width -
//                                               150,
//                                           child: Text(
//                                             dd.description,
//                                             overflow: TextOverflow.ellipsis,
//                                           ),
//                                         ),
//                                         Text(
//                                           '₹${dd.productMrp.toString()}',
//                                           textAlign: TextAlign.left,
//                                           style: TextStyle(color: Colors.red),
//                                         ),
//                                         // ProductItem(),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             );

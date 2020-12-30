// import 'dart:convert';
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shopping_app/models/modell.dart';
// import 'package:shopping_app/models/product_items.dart';
// import 'package:shopping_app/provider/api_provider.dart';

// class APIWORK extends StatefulWidget {
//   @override
//   _APIWORKState createState() => _APIWORKState();
// }

// class _APIWORKState extends State<APIWORK> {
//   Future<Welcome> _newModel;
//   // var _isInt = true;
//   @override
//   void initState() {
//     _newModel = ApiManager().getAnotherr();
//     super.initState();
//   }

//   // @override
//   // void didChangeDependencies() {
//   //   if (_isInt) {
//   //     _newModel = ApiManager().getNew();
//   //   }
//   //   _isInt = false;
//   //   super.didChangeDependencies();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('API'),
//       ),
//       body: FutureBuilder<Welcome>(
//           future: _newModel,
//           builder: (centex, snapshot) {
//             print(snapshot.hasData);
//             if (snapshot.hasData)
//               return GridView.builder(
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     childAspectRatio: 4 / 3,
//                     crossAxisCount: 2,
//                     crossAxisSpacing: 3,
//                   ),
//                   scrollDirection: Axis.vertical,
//                   itemCount: snapshot.data.count,
//                   itemBuilder: (context, index) {
//                     var dd = snapshot.data.data[index];
//                     return GridView.builder(
//                         physics: NeverScrollableScrollPhysics(),
//                         // scrollDirection: Axis.vertical,
//                         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                           childAspectRatio: 3 / 2,
//                           crossAxisCount: 1,
//                           crossAxisSpacing: 3,
//                         ),
//                         shrinkWrap: true,
//                         itemCount: dd.productCategories.length,
//                         itemBuilder: (context, ind) {
//                           var dt = snapshot
//                               .data.data[index].productCategories[ind].category;
//                           return Text(dt.name);
//                         });
//                   });
//             else
//               return Center(child: CircularProgressIndicator());
//           }),
//     );
//   }
// }

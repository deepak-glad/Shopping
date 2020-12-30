// import 'dart:convert';
// import 'dart:io';
// // import 'package:shopping_app/models/model.dart' as dd;
// import 'package:shopping_app/models/modell.dart';
// import 'package:http/http.dart' as http;

// class ApiManager {
//   // Future<dd.Welcome> getNew() async {
//   //   var newModel = null;
//   //   // var client = http.Client();
//   //   final response = await http.get(
//   //     'http://204.48.26.50:7058/api/product/list',
//   //     headers: {
//   //       HttpHeaders.authorizationHeader:
//   //           "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImFmYzI3NTRkLTg1MzAtNDRmZC1hZmFlLTNmMTg1ZjkzNzBhMiIsImlhdCI6MTYwODcyNzA4NzIxNX0.r9SeFyCv05OofPL20nuum8x7nak_eIo8aOBjw4qa9n8"
//   //     },
//   //   );
//   //   print(response.statusCode);
//   //   try {
//   //     if (response.statusCode == 200) {
//   //       var jsonString = response.body;
//   //       var jsonMap = jsonDecode(jsonString);
//   //       newModel = Welcome.fromJson(jsonMap);
//   //     }
//   //   } catch (Exception) {
//   //     return newModel;
//   //   }
//   //   return newModel;
//   // }

//   Future<Welcome> getAnotherr() async {
//     var nnewModel = null;
//     const url =
//         'https://shopping-b68f2-default-rtdb.firebaseio.com/product.json';

//     try {
//       final response = await http.get(url);
//       // print(jsonDecode(response.body));
//       // if (response.statusCode == 200) {
//       var jsonString = response.body;
//       var jsonMap = jsonDecode(jsonString);
//       nnewModel = Welcome.fromJson(jsonMap);
//       // print(jsonMap);

//       // }
//     } catch (errr) {
//       throw errr;
//     }
//     // print(nnewModel);
//     return nnewModel;
//   }
// }

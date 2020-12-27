import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_app/models/model.dart';

class APIWORK extends StatefulWidget {
  @override
  _APIWORKState createState() => _APIWORKState();
}

class _APIWORKState extends State<APIWORK> {
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
  // final responseJson = jsonDecode(response.body);

  // return Welcome.fromJson(responseJson);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API'),
      ),
      body: FutureBuilder<Welcome>(
          future: fetchAlbum(),
          builder: (centex, snapshot) {
            if (snapshot.hasData)
              return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: snapshot.data.count,
                  itemBuilder: (context, index) {
                    var dd = snapshot.data.data[index];
                    // var ddd = snapshot
                    //     .data.data[index].productCategories[index].category;
                    // print(ddd);
                    return Container(
                      // height: 100,
                      color: Colors.grey,
                      child: Column(
                        children: [
                          Text(dd.name),
                          Text('₹${dd.productMrp.toString()}'),
                          Text(
                            dd.description,
                            overflow: TextOverflow.fade,
                          ),
                          ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              // scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: dd.productCategories.length,
                              itemBuilder: (context, ind) {
                                // print(dd.productCategories[index].id);
                                // print(snapshot
                                //     .data
                                //     .data[index]
                                //     .productCategories[ind]
                                //     .category
                                //     .medium
                                //     .url);
                                var image = snapshot.data.data[index]
                                    .productCategories[ind].category;
                                return Container(
                                  color: Colors.amber,
                                  height: 100,
                                  margin: const EdgeInsets.all(8),
                                  child: Row(
                                    children: [
                                      Card(
                                        clipBehavior: Clip.antiAlias,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        child: AspectRatio(
                                            aspectRatio: 1,
                                            child: Image.network(
                                              image == null
                                                  ? 'https://cdn.pixabay.com/photo/2015/12/01/20/28/road-1072823_1280.jpg'
                                                  : image.medium.url,
                                              fit: BoxFit.cover,
                                            )),
                                      ),
                                      SizedBox(width: 16),
                                      // Flexible(
                                      //     child: Text(
                                      //   snapshot.data.data[index]
                                      //       .productCategories[ind].id,
                                      //   overflow: TextOverflow.ellipsis,
                                      // ))
                                    ],
                                  ),
                                );
                              })
                        ],
                      ),
                    );
                  });
            else
              print(snapshot.connectionState);
            print(snapshot.hasData);
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}

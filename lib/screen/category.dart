import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  static const routeName = '/category-screen';

  _expande(BuildContext context, String image, String title, Color color) {
    return ExpansionTile(
      // tilePadding: EdgeInsets.only(left: 15),
      backgroundColor: color,
      collapsedBackgroundColor: color,
      leading: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20,
          // backgroundColor: Colors.,
        ),
        textAlign: TextAlign.left,
      ),
      title: Image.asset(
        image,
        // height: 100,
        // width: 100,
        fit: BoxFit.fill,
        height: 150,
        width: 500,
      ),
      children: [
        ExpansionTile(
          title: Text(
            'Sub title',
          ),
          children: <Widget>[
            ListTile(
              title: Text('data'),
              onTap: () {},
            )
          ],
        ),
        ListTile(
          title: Text('data'),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Category',
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        backgroundColor: Theme.of(context).canvasColor,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          _expande(
            context,
            'assets/category/women.png',
            'Women',
            Color.fromRGBO(255, 236, 150, 0.4),
          ),
          _expande(context, 'assets/category/cartoon.png', 'KIDS',
              Color.fromRGBO(253, 181, 255, 0.4)),
          _expande(
            context,
            'assets/category/menn.png',
            'MENS',
            Color.fromRGBO(181, 255, 239, 0.4),
          ),
          _expande(
            context,
            'assets/category/women.png',
            'Women',
            Color.fromRGBO(255, 236, 150, 0.4),
          ),
          _expande(context, 'assets/category/cartoon.png', 'KIDS',
              Color.fromRGBO(253, 181, 255, 0.4)),
          _expande(
            context,
            'assets/category/menn.png',
            'MENS',
            Color.fromRGBO(181, 255, 239, 0.4),
          ),
        ]),
      ),
    );
  }
}

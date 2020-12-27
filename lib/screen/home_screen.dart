import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shopping_app/provider/cart.dart';
import 'package:shopping_app/screen/category.dart';
import 'package:shopping_app/screen/cart_screen.dart';
import 'package:shopping_app/screen/profile.dart';
import '../widgets/home.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:shopping_app/widgets/drawer.dart';
import '../widgets/cart_badge.dart';
import '../models/search.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/provider/Product_provider.dart';

class ShopApp2 extends StatefulWidget {
  @override
  _ShopApp2State createState() => _ShopApp2State();
}

enum FilterOption {
  All,
  Only,
}

class _ShopApp2State extends State<ShopApp2> {
  int _currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Widget> _children = [
    Home(),
    Category(),
    Order(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    final containerFav = Provider.of<ProductProvider>(context, listen: false);
    // final cart = Provider.of<Cart>(context, listen: false);
    return Scaffold(
      drawer: AppDrawer(),
      appBar: _currentIndex == 0
          ? AppBar(
              iconTheme: IconThemeData(color: Colors.black),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'SHOPING',
                    // textAlign: TextAlign.start,
                    style: TextStyle(color: Colors.red),
                  ),
                  Row(
                    children: [
                      PopupMenuButton(
                        onSelected: (FilterOption selectedValue) {
                          if (selectedValue == FilterOption.Only) {
                            containerFav.favoritesOnly();
                          } else {
                            containerFav.showAll();
                          }
                          // print(selectedValue);
                        },
                        icon: Icon(
                          Icons.favorite,
                          // color: Colors.red,
                        ),
                        itemBuilder: (_) => [
                          PopupMenuItem(
                            child: Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                            value: FilterOption.Only,
                          ),
                          PopupMenuItem(
                            value: FilterOption.All,
                            child: Icon(Icons.favorite_border_sharp),
                          ),
                        ],
                      ),
                      // IconButton(
                      //   icon: Icon(Icons.favorite),
                      //   onPressed: () {
                      //      Navigator.of(context).pushNamed(Favorite.routeName);
                      //   },
                      //   color: Theme.of(context).accentColor,
                      // ),
                      IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          showSearch(context: context, delegate: DataSearch());
                        },
                      ),
                      Consumer<Cart>(
                          builder: (_, cart, ch) => OrdersWiget(
                                child: ch,
                                value: cart.itemCount.toString(),
                              ),
                          child: IconButton(
                            icon: Icon(Icons.shopping_cart),
                            onPressed: () {
                              Navigator.of(context).pushNamed(Order.routeName);
                            },
                          ))
                    ],
                  ),
                ],
              ),
              backgroundColor: Theme.of(context).canvasColor,
            )
          : null,
      body: _children[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
        ]),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
                gap: 8,
                activeColor: Colors.black,
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                duration: Duration(milliseconds: 600),
                tabBackgroundColor: Colors.grey[400],
                tabs: [
                  GButton(
                    icon: LineIcons.home,
                    text: 'Home',
                  ),
                  GButton(
                    icon: LineIcons.heart_o,
                    text: 'Category',
                  ),
                  GButton(
                    icon: Icons.store,
                    text: 'Store',
                  ),
                  GButton(
                    icon: LineIcons.user,
                    text: 'Profile',
                  ),
                ],
                selectedIndex: _currentIndex,
                onTabChange: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                }),
          ),
        ),
      ),
    );
  }
}

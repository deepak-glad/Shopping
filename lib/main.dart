import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/models/modell.dart';
import 'package:shopping_app/provider/cart.dart';
import 'package:shopping_app/provider/favorite.dart';
import 'package:shopping_app/provider/profile_provider.dart';
import 'package:shopping_app/screen/api.dart';
import 'package:shopping_app/screen/favorite_screen.dart';
import 'package:shopping_app/screen/login_screen.dart';
import 'package:shopping_app/screen/ordered_screen.dart';
import 'package:shopping_app/screen/personalInformation.dart';
import 'package:shopping_app/screen/product_detail.dart';
import 'package:shopping_app/screen/profile.dart';
import 'package:shopping_app/screen/splash_screen.dart';
import 'screen/cart_screen.dart';
import 'screen/home_screen.dart';
import 'package:provider/provider.dart';
import 'provider/Product_provider.dart';
import 'screen/category.dart' as dd;
import 'provider/order_provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: ProductProvider()),
        ChangeNotifierProvider.value(value: Cart()),
        ChangeNotifierProvider(create: (ctx) => Orders()),
        ChangeNotifierProvider(create: (ctx) => ProfilePhoto()),
        ChangeNotifierProvider(create: (ctx) => FavoritePage()),
        ChangeNotifierProvider(create: (ctx) => Welcome()),
      ],
      child: MaterialApp(
        title: 'SHOP',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          disabledColor: Colors.grey,
          shadowColor: Color.fromRGBO(252, 224, 146, 0.9),
          canvasColor: Colors.white,
          accentColor: Colors.black,
          primarySwatch: Colors.amber,
          errorColor: Colors.red,
          brightness: Brightness.light,
          primaryColor: Colors.black,
          // textTheme: TextTheme(bodyText2: TextStyle(color: Colors.black)),
          iconTheme:
              Theme.of(context).primaryIconTheme.copyWith(color: Colors.red),
        ),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return SplashScreen();
            } else if (snapshot.hasData) {
              return ShopApp2();
            }
            return LoginScreen();
          },
        ),
        // home: APIWORK(),
        routes: {
          ProductDetail.routeName: (ctx) => ProductDetail(),
          dd.Category.routeName: (ctx) => dd.Category(),
          Order.routeName: (ctx) => Order(),
          Profile.routeName: (ctx) => Profile(),
          Personal.routeName: (ctx) => Personal(),
          OrderScreen.routeName: (ctx) => OrderScreen(),
          FavoriteScreen.routeName: (ctx) => FavoriteScreen(),
          // SlidupPanel.routeName: (ctx) => SlidupPanel(),
          // Favorite.routeName: (ctx) => Favorite(),
        },
      ),
    );
  }
}

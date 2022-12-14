import 'package:flutter/material.dart';
import 'package:provider/provider.dart';







import './screens/splash_screen.dart';
import './screens/products_overview_screen.dart';
import './screens/product_detail_screen.dart';
import './screens/cart_screen.dart';
import '../providers/orders.dart';
import '../providers/auth.dart';
import './providers/products.dart';
import './providers/cart.dart';
import './screens/orders_screen.dart';
import './screens/user_products_screen.dart';
import './screens/edit_product_screen.dart';
import './screens/auth_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
      ChangeNotifierProvider(
        create: (context) => Auth(),
      ),
      ChangeNotifierProxyProvider<Auth, Products>(
             create: (ctx) => Products('',[],''),
             //have to be check
      update: (ctx, auth, previousProducts) 
      => Products
        (
        auth.token.toString(),
      previousProducts == null 
      ? [] 
      :previousProducts.items,
          auth.userId,
      ),
      ),
      ChangeNotifierProvider(
      create:(context) =>
       Cart(),
      ),
      ChangeNotifierProxyProvider<Auth, Orders>(
        create: (ctx) => Orders(null.toString(),null.toString(),[]),
        update: ((ctx, auth, previousOrders) 
        => Orders(
          auth.token.toString(),
          auth.userId,
          previousOrders == null 
          ? []
          :previousOrders.orders,
          )),
      ),
      ],
      child: Consumer<Auth>(
         builder: (ctx, auth, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'MyShop',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch(
                primarySwatch: Colors.purple)
                .copyWith(secondary: Colors.deepOrange),
                fontFamily: 'Lato',
          ),
          home: auth.isAuth
          ? ProductsOverviewScreen()
          : FutureBuilder(
            future: auth.tryAutoLogin(),
            builder:(ctx, authResultSnapshot) =>
            authResultSnapshot.connectionState ==
            ConnectionState.waiting
            ? const SplashScreen()
            : AuthScreen(),
            ),
          routes: {
            ProductDetailScreen.routeName:(context) => ProductDetailScreen(),
            CartScreen.routeName:(context) => CartScreen(),
            OrdersScreen.routeName:(context) => OrdersScreen(),
            UserProductsScreen.routeName:(context) => UserProductsScreen(),
            EditProductScreen.routeName:(context) => EditProductScreen(),
          },
        ),
      ),
    );
  }
}

 
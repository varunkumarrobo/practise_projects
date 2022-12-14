import 'package:flutter/material.dart';
import 'package:provider/provider.dart';






import '../widgets/products_grid.dart';
import '../screens/cart_screen.dart';
import '../widgets/badge.dart';
import '../providers/cart.dart';
import '../widgets/app_drawer.dart';
import '../providers/products.dart';


enum FilterOptions {
  Favorites,
  All,}

class ProductsOverviewScreen extends StatefulWidget {
  
  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {

   var _showOnlyFavorites = false;
   var _isInit = true;
   var _isLoading = false;

   @override
  void initState() {
    //Provider.of<Products>(context,).fetchAndSetProducts(); //Won't work in a initState!
    // Future.delayed(Duration.zero).then((_) => {
    //   Provider.of<Products>(context,listen: false).fetchAndSetProducts(),
    // });
    super.initState();
  }

  //dont use async and await in initstate nd didchangedep....
  // instead use then nd future

  @override
  void didChangeDependencies() {
    if(_isInit){
      setState(() {
      _isLoading = true;
      });
       Provider.of<Products>(context).fetchAndSetProducts().then((_) {
        setState(() {
        _isLoading = false;
        });
       });
    }
    _isInit = false;
    super.didChangeDependencies();
  }
   // @override
   // void didChangeDependencies() {
   //   if (_isInit) {
   //     setState(() {
   //       _isLoading = true;
   //     });
   //     Future.delayed(Duration(milliseconds: 500)).then((_) {
   //       Provider.of<Products>(context, listen: false).fetchAllProducts().then((_) {
   //         setState(() {
   //           _isLoading = false;
   //         });
   //       });
   //     });
   //   }
   //   _isInit = false;
   //   super.didChangeDependencies(); }


  @override
  Widget build(BuildContext context) {
    // final productsContainer = Provider.of<Products>(
      // context,listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyShop'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue){
              setState(() {
                if(selectedValue == FilterOptions.Favorites){
                _showOnlyFavorites = true;
                // productsContainer.showFavoritesOnly();
              }else {
                _showOnlyFavorites = false;
                // productsContainer.showAll();            
              }
              });
            },
            itemBuilder: (_) => const[
              PopupMenuItem(
                value: FilterOptions.Favorites,
                child: Text("Only Favorites"),),
              PopupMenuItem(
                value: FilterOptions.All,
                child: Text('Show All'),),
            ],
            icon: const Icon(Icons.more_vert,
            ),
            ),
            Consumer<Cart>(builder: (ctx,cart,ch) =>
             Badge(
               value: cart.itemCount.toString(),
             child: ch!,
              ),
              child:  IconButton(
              onPressed: (){
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
              icon: const Icon(Icons.shopping_cart),
              ),
               ),
        ],
      ),
      drawer: AppDrawer(),
      body: _isLoading
      ?const Center(child: CircularProgressIndicator(),)
      : ProductsGrid(
        _showOnlyFavorites,
      ),
    );
  }
}



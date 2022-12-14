import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../screens/edit_product_screen.dart';
import '../providers/products.dart';

class UserProductItem extends StatelessWidget {
   final String id;
   final String title;
   final String imageUrl;
   

  const UserProductItem(
    this.id,
    this.title, 
    this.imageUrl,
    {super.key,});



  @override
  Widget build(BuildContext context) {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
            onPressed: (){
              Navigator.of(context).pushNamed(
                EditProductScreen.routeName,
                arguments: id,
                );
            },
            icon: const Icon(Icons.edit),
            color:Theme.of(context).colorScheme.primary,),
            IconButton(
            onPressed: () async {
              try{
                await Provider.of<Products>(
                context,listen: false).deleteProduct(id);
              }catch (error){
               scaffoldMessenger.showSnackBar(
                  const SnackBar(
                    content: Text('Deleting failed!'),),);
              }
            },
            icon: const Icon(Icons.delete),
            color:Theme.of(context).errorColor,),
          ],
        ),
      ),
    );
  }
}
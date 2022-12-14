import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

 import '../providers/product.dart';
 import '../providers/products.dart';

class EditProductScreen extends StatefulWidget {
  
  static const routeName = '/edit-product';
  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imageUrlController = TextEditingController();
  final _imageUrlFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();

  var _editedProduct = Product(
    id: null, 
    title: 'title', 
    description: 'description', 
    price: 0, 
    imageUrl: 'imageUrl',
    );

  var _initValues = {
   'title':'',
   'description':'',
   'price':'',
   'iamgeUrl':'',
  };

  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    _imageUrlFocusNode.addListener(_updateImageUrl);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit ){
      final productId = ModalRoute.of(context)!.settings.arguments;
      print('vishwa = ${productId}');
      if(productId != null){
        _editedProduct = Provider.of<Products>(context,listen: false).findById(productId.toString());
       _initValues = {
        'title': _editedProduct.title,
        'description': _editedProduct.description,
        'price': _editedProduct.price.toString(),
        // 'imageUrl':_editedProduct.imageUrl,
        'imageUrl':'',
      };
      _imageUrlController.text = _editedProduct.imageUrl;
      }
      //final _editedproduct = Provider.of<Products>(context,listen: false).findById(productId);
    }
    _isInit = false;
    super.didChangeDependencies();
  }



  @override
  void dispose() {
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _imageUrlController.dispose();
    _imageUrlFocusNode.dispose();
    _imageUrlFocusNode.removeListener(_updateImageUrl);
    super.dispose();
  }

  void _updateImageUrl (){
    if(!_imageUrlFocusNode.hasFocus){
      if((!_imageUrlController.text.startsWith('http')
        && !_imageUrlController.text.startsWith('https'))||
       (!_imageUrlController.text.endsWith('.png')
       && ! _imageUrlController.text.endsWith('.jpg') 
      && !_imageUrlController.text.endsWith('jpeg'))) {
      }                 
      setState(() { });
    }
  }

  Future<void> _saveForm() async {
     final isValid =_form.currentState!.validate();
     if(!isValid){
      return;
     }
    _form.currentState!.save();
    setState(() {
      _isLoading = true;
    });
    if(_editedProduct.id != null){
     await Provider.of<Products>(context,listen: false)
            .updateProduct(_editedProduct.id!, _editedProduct);
      //print('updated');  
    }else{
      //print('added');
      try{
        await Provider.of<Products>(context,listen: false)
         .addProduct(_editedProduct);
    // .catchError((error){
      } catch(error){
        await showDialog(
          context: context,
         builder:  (ctx) =>   AlertDialog(
        title: const Text('An error occurred!'),
        content: const Text('Something went wrong.'),
        actions: [
          TextButton(
            onPressed: (){
            Navigator.of(ctx).pop();
          }, child: const Text('Okay'),
          ),
        ],
       ),
       );
    } 
    // finally{
    //      setState(() {
    //      _isLoading = false;
    //       });
    //   Navigator.of(context).pop();
    // }
    // .then((_) {
    // });
    }
     setState(() {
         _isLoading = false;
      });
      Navigator.of(context).pop();
    print(_editedProduct.id);
    print(_editedProduct.title);
    print(_editedProduct.price);
    print(_editedProduct.description);
    print(_editedProduct.imageUrl);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Product'),
        actions: [
          IconButton(
            onPressed: (){
            setState(() {
              _saveForm();
            });
          },
           icon: const Icon(Icons.save))
        ],
      ),
      body: _isLoading 
        ? const Center(child: CircularProgressIndicator(),)
        : Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _form,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextFormField(
                  initialValue: _initValues['title'],
                  decoration: const InputDecoration(labelText: 'Title',),
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_){
                      FocusScope.of(context).requestFocus(_priceFocusNode);
                    },
                    validator: (newValue) {
                      if(newValue!.isEmpty){
                      return 'Please provide a value.' ; 
                      }
                      return null;
                    },
                    onSaved: (newValue) {
                      _editedProduct = 
                      Product(
                        id: _editedProduct.id, 
                        title: newValue.toString(), 
                        description: _editedProduct.description, 
                        price: _editedProduct.price, 
                        imageUrl: _editedProduct.imageUrl,
                        isFavorite: _editedProduct.isFavorite,
                        );
                    },),
                TextFormField(
                  initialValue: _initValues['price'],
                  decoration: const InputDecoration(labelText: 'Price',),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    focusNode: _priceFocusNode,
                    onFieldSubmitted: (_){
                      FocusScope.of(context).requestFocus(_descriptionFocusNode);
                    },
                     validator: (newValue) {
                      if(newValue!.isEmpty){
                      return 'Please enter a price.' ; 
                      }
                      if(double.tryParse(newValue) == null){
                        return 'Please enter a valid number.';
                      }
                      if(double.parse(newValue)<= 0){
                        return 'Please enter a number greater than zero.';
                      }
                      return null;
                    },
                    onSaved: (newValue) {
                      _editedProduct = 
                      Product(
                        id: _editedProduct.id,
                        isFavorite: _editedProduct.isFavorite, 
                        title: _editedProduct.title, 
                        description: _editedProduct.description, 
                        price: double.parse(newValue.toString()), 
                        imageUrl: _editedProduct.imageUrl,
                        );
                    },
                    ),
                TextFormField(
                  initialValue: _initValues['description'],
                  decoration: const InputDecoration(labelText: 'Description',),
                  maxLines: 3,
                  keyboardType: TextInputType.multiline,
                  focusNode: _descriptionFocusNode,
                  validator: ((newValue) {
                    if(newValue!.isEmpty){
                      return 'Please enter a description.';
                    }
                    if(newValue.length < 10){
                      return 'Should be at least 10 characters long.';
                    }
                    return null;
                  }),
                  onSaved: (newValue) {
                      _editedProduct = 
                      Product(
                        id: _editedProduct.id,
                        isFavorite: _editedProduct.isFavorite, 
                        title: _editedProduct.title, 
                        description: newValue.toString(), 
                        price: _editedProduct.price, 
                        imageUrl: _editedProduct.imageUrl,
                        );
                    },
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      margin: const EdgeInsets.only(top: 8, right: 10),
                      decoration: BoxDecoration(border: Border.all(
                        width: 1,
                        color: Colors.grey,
                      ),
                      ),
                      child: _imageUrlController.text.isEmpty 
                      ? const Text('Enter a URL')
                      :FittedBox(
                        child: Image.network(
                          _imageUrlController.text,
                          fit: BoxFit.cover,
                          ),),
                    ),
                    Expanded(
                      child: TextFormField(
                        // initialValue: _initValues['imageUrl'],
                        decoration: const InputDecoration(labelText: 'Image URL'),
                        keyboardType: TextInputType.url,
                        textInputAction: TextInputAction.done,
                        controller: _imageUrlController,
                        focusNode: _imageUrlFocusNode,
                        onEditingComplete: () {
                          setState(() {
                            _saveForm();
                            });
                        },
                        validator: (newValue) {
                          String pattern =
                          r'^((?:.|\n)*?)((http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:​,.;]*)?)';
                      RegExp regExp = RegExp(pattern);
                      if (newValue!.isEmpty) {
                        return "Please enter your website";
                      } else if (!(regExp.hasMatch(newValue))) {
                        return "Website Url must be started from www";
                      } else {
                        return null;
                      }
                        },
                         onSaved: (newValue) {
                      _editedProduct = 
                      Product(
                        id: _editedProduct.id,
                        isFavorite: _editedProduct.isFavorite, 
                        title: _editedProduct.title, 
                        description: _editedProduct.description, 
                        price: _editedProduct.price, 
                        imageUrl: newValue.toString(),
                        );
                    },
                      ),
                    ),
                  ],
                )
              ],
            ),
          )),
      ),
    );
  }
}
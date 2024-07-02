
// import 'package:flutter/material.dart';

// import '../../../helper/shared_refrene_healper.dart';
// import '../model/product_info_model.dart/cart.dart';
// import '../model/product_info_model.dart/product.dart';
// import '../model/product_info_model.dart/product_cart.dart';
// import 'cart_model_view.dart';
// import 'product_view_model.dart';

// class ProductCartViewModel with ChangeNotifier{
//   CartViewModel allCart = CartViewModel();
//   ProdictViewModel allProduct = ProdictViewModel();

//   List<Product> _products=[];
//   List<Product>get products => _products;
 
//    ProductCartViewModel(){
//     // getAllCarts();
//    }

//   // List<Product> 
//   getProductByCart(){
//     // getUserInfoByToken();
//     // allCart.getUserCart(SharedPrefsHelper.getInt('id').toString());
//     List<Product> productCartList = [];
//     for (Cart cart in allCart.carts) {
//   if (cart.products != null) {
//     for (ProductCart productCart in cart.products!) {
//       Product matchingProduct = allProduct.products.firstWhere(
//         (product) => product.id == productCart.productId,
//         // orElse: () => Product.empty(),
//       );

//       if (matchingProduct.id != 0) {
//         // Do something with the matching product
//         print('Cart ID: ${cart.id}, Product ID: ${matchingProduct.id}, Name: ${matchingProduct.title}');
//       }
//     }
//   }
// }
//    }
   
   


  

// }
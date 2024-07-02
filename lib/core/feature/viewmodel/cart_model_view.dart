import 'package:e_commesce_app/core/constants/api_routes.dart';
import 'package:e_commesce_app/core/feature/model/product_info_model.dart/product.dart';
import 'package:e_commesce_app/core/feature/viewmodel/product_view_model.dart';
import 'package:e_commesce_app/core/repositories/data_repo.dart';
import 'package:e_commesce_app/core/repositories/online_data.dart';
import 'package:flutter/material.dart';

import '../model/product_info_model.dart/cart.dart';
import '../model/product_info_model.dart/product_cart.dart';

class CartViewModel with ChangeNotifier{
  
  
  List<Cart> _carts=[];
  List<Cart>get carts => _carts;
  
  List<Product> _productsInCart = [];
  List<Product>get productsInCart => _productsInCart;
  
  
   CartViewModel(){
    // getAllCarts();
    
    getProductsInCart();
   }

Future<List<Cart>> loadData(DataRepo repo, String source) async {
  try {
    List<dynamic> d = await repo.getData(source: source) ;
    print("d is $d");
    List<Cart> allCarts = d.map((e) => Cart.fromJson(e)).toList();
    
    return allCarts;
  } catch (e) {
    print(" loadData Cart error is $e");
    return [];
  }
}

  

//     Future<List<Cart>> getAllCarts ()async{
//    _carts =  await loadData(OnlineDataRepo(), API_URL.CART);
 
//  notifyListeners();
//   print("Carts : $_carts");
//  return _carts;

// }

Future<List<Cart>> getProductsInCartByUser(String route) async {
  try {
    _carts = await loadData(OnlineDataRepo(), route);
    print("carts in getProductsInCartByUser is : $_carts");
    notifyListeners();
    return _carts;
  } catch (e) {
    print("Error fetching products: $e");
    rethrow;
  }
}

 Future<List<Product> > getProductsInCart()async{
  // ProdictViewModel p =ProdictViewModel()  ;
  ProdictViewModel p =ProdictViewModel();
  List<Product> allProducts =await p.getAllProducts();
  // List<Product> allProductInCart =await getProductsInCart();
  print(" is :p.allProducts : ${allProducts} ");
  // print(" is :p.products : ${allProductInCart} ");
  if (_carts.isNotEmpty) {
    for (Product product in allProducts) {
    for (ProductCart cart in carts[0].products!) {
      if (product.id == cart.productId) {
        _productsInCart.add(product);
      }
    }
  }
  }
  print("_productsInCart is $_productsInCart");
  // for (int num in p.products) {
  //   if (list2.contains(num)) {
  //     list3.add(num);
  //   }
  // }
  return _productsInCart;
}



// Future<List<Cart>> getUserCart (String route)async{
//   userCartList =  await loadData(OnlineDataRepo(), route);
//       if (userList[int.parse(route)].id == userCartList[0].userId) {
//         print("userList is $userList");
//         print("userList userCartList is $userCartList");
//       }
  
//  notifyListeners();
 
//  return userCartList;

// }
   
   Future<Map<String,dynamic>>addCart(DataRepo repo,Cart Cart)async{
    print("inside addTrip trip is $carts");
   Map<String,dynamic>feedback=await repo.postData(Cart.toJson(),API_URL.CART);
   _carts.add(Cart);
   print("feedback is :$feedback" );
   return feedback;

  }

//   static getshared()async{
  
//    SharedPrefsHelper.init();

//     phoneNumber = SharedPrefsHelper.getString("phone_number")?? "قم بادخال رقم هاتفك";
//     name = SharedPrefsHelper.getString("name")?? "قم بادخال اسمك";
//     id = SharedPrefsHelper.getInt("id");
//     role_type = SharedPrefsHelper.getString("roles");
//     token = SharedPrefsHelper.getString("token")?? "قم بإنشاء حساب";
// }
    



deleteCart(DataRepo repo, Cart cart) async {
   await repo.deleteData({"id": cart.id}, API_URL.CART);
   _carts.remove(Cart);
   notifyListeners();
}

}
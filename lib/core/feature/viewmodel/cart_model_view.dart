import 'package:e_commesce_app/core/constants/api_routes.dart';
import 'package:e_commesce_app/core/feature/model/product_info_model.dart/product.dart';
import 'package:e_commesce_app/core/feature/viewmodel/product_view_model.dart';
import 'package:e_commesce_app/core/repositories/data_repo.dart';
import 'package:e_commesce_app/core/repositories/online_data.dart';
import 'package:flutter/material.dart';

import '../../functions/get_user_info.dart';
import '../model/product_info_model.dart/cart.dart';
import '../model/product_info_model.dart/product_cart.dart';

class CartViewModel with ChangeNotifier{
  
  //ذي فيها بيانات السلة الخاصة بمستخدم معين
  List<Cart> _carts=[];
  List<Cart>get carts => _carts;
  
  //ذي فيها بيانات المنتجات الموجودة في السلة
  final List<Product> _productsInCart = [];
  List<Product>get productsInCart => _productsInCart;
  
  
   CartViewModel(){
    // getAllCarts(); 
    getCartByUser();
    getProductsInCart();
   }

Future<List<Cart>> loadData(DataRepo repo, String source) async {
  try {
    List<dynamic> d = await repo.getListData(source: source) ;
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

//هاذي عشان تجيب السلة حق المستخدم الحالي
Future<List<Cart>> getCartByUser() async {
  try {
    _carts = await loadData(OnlineDataRepo(), "${API_URL.CART_OF_USER}/${UserInfo.id}");
    print("carts in getProductsInCartByUser is : $_carts");
    notifyListeners();
    return _carts;
  } catch (e) {
    print("Error fetching products: $e");
    rethrow;
  }
}

//هاذي عشان تجيب المنتجات الي داخل السلة
 Future<List<Product> > getProductsInCart()async{
  ProdictViewModel p =ProdictViewModel();
  List<Product> allProducts =await p.getAllProducts();
  // List<Product> allProductInCart =await getProductsInCart();
  print(" is :p.allProducts : $allProducts ");
  print(" is :p.products : ${carts} ");
  if (carts.isNotEmpty) {
    for (Product product in allProducts) {
    for (ProductCart cart in carts[0].products!) {
      if (product.id == cart.productId) {
        print("_carts.isNotEmpty = $cart");
        _productsInCart.add(product);
      }
    }
  }
  }else { print("لستة الكارت ثقيلة الدم فاضية علها الحوش");}
  print("_productsInCart is $_productsInCart");

  notifyListeners();
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
   
   Future<Map<String,dynamic>>addCart(DataRepo repo,Cart cart)async{
    print("inside addCart cart is $carts");
   Map<String,dynamic>feedback=await repo.postData(cart.toJson(),API_URL.CART);
   _carts.add(cart);
   print("feedback is :$feedback" );
   return feedback;

  }


deleteCart(DataRepo repo, Cart cart) async {
   await repo.deleteData({"id": cart.id}, API_URL.CART);
   _carts.remove(Cart);
   notifyListeners();
}

Future<Map<String,dynamic>>editCart(DataRepo repo, Cart cart, int cartId)async{

try {
  print("usl is : ${API_URL.CART}/${cartId}");
  print("data to send is : ${cart.toJson()}");
  Map<String,dynamic> data = await repo.putData(cart.toJson(), '${API_URL.CART}/${cartId}');
print("edit data is $data");
notifyListeners();
return data;

} catch (e) {
  print("Error fetching products: $e");
    rethrow;
}
}

double? getSubTotal(){
double subTotal = 0.0;
  for (Product product in productsInCart) {
    int quantity = getProductQuantity(product.id!);
    subTotal += product.price! * quantity;
  }
print("sub total = $subTotal");
// notifyListeners();
return subTotal;
 
}
int getProductQuantity(int productId) {
  for (ProductCart productCart in _carts.first.products!) {
    if (productCart.productId == productId) {
      return productCart.quantity!;
    }
  }
  return 0;
}

double applyDiscount(double total) {
  double discountRate = 0.06; 
  return total - (total * discountRate);
  
}

}
import 'package:e_commesce_app/core/constants/api_routes.dart';
import 'package:e_commesce_app/core/feature/model/product_info_model.dart/product.dart';
import 'package:e_commesce_app/core/repositories/data_repo.dart';
import 'package:e_commesce_app/core/repositories/online_data.dart';
import 'package:flutter/material.dart';

class ProdictViewModel with ChangeNotifier{
  
  
  List<Product> _products=[];
  List<Product>get products => _products;
  
   ProdictViewModel(){
    getAllProducts();
   }

Future<List<Product>> loadData(DataRepo repo, String source) async {
  try {
    List<dynamic> d = await repo.getData(source: source) ;
    print("d is $d");
    List<Product> allProducts = d.map((e) => Product.fromJson(e)).toList();
    // Map<String, dynamic> data = await repo.getData(source: source) ;
    // List<dynamic> d = data.values.toList();
    // List<Product> allProducts =[];
    //  data.map((e) => Product.fromJson(e)).toList();
    // print("all product is: $allProducts");
    return allProducts;
  } catch (e) {
    print(" loadData Product error is $e");
    return [];
  }
}

    
  //  Future<List<Product>>loadData(DataRepo repo,String source)async{
  //   //print(source);
  //  try {
  //    Map<String,dynamic>data=await repo.getData(source: source);
  //  List<dynamic> d =data["data"];
  //  List<Product>allProducts=d.map((e) => Product.fromJson(e)).toList();
  //  print("all product is: $d");
  //  return allProducts;

  //  } catch (e) {
  //    print(" loadData Product error is $e");
  //    return [];
  //  }

  // }


    Future<List<Product>> getAllProducts ()async{
   _products =  await loadData(OnlineDataRepo(), API_URL.PRODUCTS);
 
 notifyListeners();
  print("Products : ${_products}");
 return _products;

}
   
   Future<Map<String,dynamic>>addProduct(DataRepo repo,Product product)async{
    print("inside addTrip trip is $products");
   Map<String,dynamic>feedback=await repo.postData(product.toJson(),API_URL.PRODUCTS);
   _products.add(product);
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
    



deleteProduct(DataRepo repo, Product product) async {
   await repo.deleteData({"id": product.id}, API_URL.SIGNUP);
   _products.remove(product);
   notifyListeners();
}

}
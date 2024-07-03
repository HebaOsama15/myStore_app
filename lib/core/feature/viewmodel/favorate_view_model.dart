import 'package:e_commesce_app/core/repositories/data_repo.dart';
import 'package:e_commesce_app/helper/sqldbHealper.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../repositories/local_repo.dart';
import '../model/product_info_model.dart/product.dart';

class FavorateModelView extends ChangeNotifier {
    List<Product>_allFavprateProducts=[];
    List<Product>get allFavprateProducts => _allFavprateProducts;

    bool showFullText = false;
    // IconData icon = IconlyLight.heart;
    int _counter = 1; 
    int get counter => _counter;

    FavorateModelView(){
      getAllFavProducts();
    }

//حق القلب يوم ينقلب حمر
  void toggleButtonColor(Product product) {
    //  icon == IconlyLight.heart ? IconlyBold.heart : IconlyLight.heart;
    //  if (icon == IconlyLight.heart) {
    //   icon = IconlyBold.heart;
    //    addFavProduct(LocalProductsRepo(), product);
    //  } else {
    //   icon = IconlyLight.heart;
    //    deleteFavProduct(LocalProductsRepo(), product);
    //  }
   if (product.isFavorite ==null) {
     product.isFavorite = false;
      product.isFavorite = !product.isFavorite!;
      if (product.isFavorite!) {
        addFavProduct(LocalProductsRepo(), product);
      } else {
        deleteFavProduct(LocalProductsRepo(), product);
      }
   }else{
     product.isFavorite = !product.isFavorite!;
      if (product.isFavorite!) {
        addFavProduct(LocalProductsRepo(), product);
      } else {
        deleteFavProduct(LocalProductsRepo(), product);
      }
   }
    notifyListeners(); 
  }

//حق الهذوة يوم تمتط
  void toggleShowFullText() {
    showFullText = !showFullText;
    notifyListeners(); 
  }


  void incrementCounter() {
    if (_counter < 10) {
      _counter++;
      notifyListeners();
    }
  }

  void decrementCounter() {
    if (_counter > 1) {
      _counter--;
      notifyListeners();
    }
  }

  Future<List<Product>>fetchProducts(DataRepo productsRepo,String source)async{
    List<dynamic> products=await productsRepo.getListData(source: source);

    print("products is $products");

    try {
    List<Product> list = products.map((e) => Product.fromJson(e)).toList();
    return list;
    }catch(ex) {
      print("the exception is $ex");
      return [];
    }
      

  }

  Future<List<Product>> getAllFavProducts ()async{
   _allFavprateProducts =  await fetchProducts(LocalProductsRepo(),DBManger.TBL_PRODUCTS );
 
 notifyListeners();
  print("Products : $_allFavprateProducts");
 return _allFavprateProducts;

}

 Future<Map<String,dynamic>>addFavProduct(DataRepo repo,Product product)async{
    print("inside addTrip trip is $_allFavprateProducts");
   Map<String,dynamic>feedback=await repo.postData(product.toJson(),DBManger.TBL_PRODUCTS);
   _allFavprateProducts.add(product);
   print("feedback is :$feedback" );
   return feedback;

  }

deleteFavProduct(DataRepo repo, Product product) async {
   await repo.deleteData({"id": product.id}, DBManger.TBL_PRODUCTS);
   _allFavprateProducts.remove(product);
   notifyListeners();
}
 
}



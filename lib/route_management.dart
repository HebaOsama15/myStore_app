
import 'package:e_commesce_app/core/feature/view/pages/cart_page.dart';
import 'package:e_commesce_app/core/feature/view/pages/detial_product.dart';
import 'package:e_commesce_app/core/feature/view/pages/favorate_page.dart';
import 'package:e_commesce_app/core/feature/view/pages/home_page.dart';
import 'package:e_commesce_app/core/feature/view/pages/navigation_bar.dart';
import 'package:e_commesce_app/core/feature/view/pages/pay_Page.dart';
import 'package:flutter/material.dart';

import 'core/errors/eror404.dart';
import 'core/feature/view/login.dart/login_page.dart';
import 'core/feature/view/pages/products_of_category_page.dart';
import 'core/feature/view/pages/search_page.dart';
import 'core/feature/view/pages/splash.dart';


class RouteManager{
 static Route<dynamic>? generateRoute(RouteSettings settings){
    switch(settings.name){
      case '/':{
        return MaterialPageRoute(builder: (ctx){
      return
      // LoginPage();
      // HomePage();
       const SplashScreen();
    
          });
    }
  //    case '/signup':{
  //     return MaterialPageRoute(builder: (ctx){
  //       return   SignupPage();
  //     });
  //   }
   
   case '/home_page':{
      return MaterialPageRoute(builder: (ctx){
        return   const HomePage();
      });
    }
         
    case '/login':{
      return MaterialPageRoute(builder: (ctx){
        return  LoginPage();
      });
    }
    case '/nav':{
      return MaterialPageRoute(builder: (ctx){
        return  const MasterPage();
      });
    }

    case '/pay_page':{
      return MaterialPageRoute(builder: (ctx){
        return  const PayPage();
      });
    }


    case '/detial_product':{
      return MaterialPageRoute(builder: (ctx){
        return const DetialProduct();
      });
    }

    case '/favorate_page':{
      return MaterialPageRoute(builder: (ctx){
        return const FavoratePage();
      });
    }

    case '/products_of_category':{
       String categoryName = settings.arguments as String;
      return MaterialPageRoute(builder: (ctx){
        return  ProductOfCategoryPage(categoryName: categoryName);
      });
    }

    case '/search_page':{
      return MaterialPageRoute(builder: (ctx){
        return  SearchPage();
      });
    }

    case '/cart':{
      return MaterialPageRoute(builder: (ctx){
        return  CartPage();
      });
    }

      default:{
        return MaterialPageRoute(builder: (ctx){
          return  const PageNotFound();
        });}
    }
  }
}
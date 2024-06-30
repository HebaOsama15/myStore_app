
import 'package:e_commesce_app/core/feature/view/cart_page.dart';
import 'package:e_commesce_app/core/feature/view/detial_product.dart';
import 'package:e_commesce_app/core/feature/view/favorate_page.dart';
import 'package:e_commesce_app/core/feature/view/home_page.dart';
import 'package:flutter/material.dart';

import 'core/errors/eror404.dart';
import 'core/feature/view/login.dart/login_page.dart';
import 'core/feature/view/splash.dart';


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
        return   HomePage();
      });
    }
         
    case '/login':{
      return MaterialPageRoute(builder: (ctx){
        return  LoginPage();
      });
    }


    case '/detial_product':{
      return MaterialPageRoute(builder: (ctx){
        return DetialProduct();
      });
    }

    case '/favorate_page':{
      return MaterialPageRoute(builder: (ctx){
        return FavoratePage();
      });
    }

    case '/cart':{
      return MaterialPageRoute(builder: (ctx){
        return CartPage();
      });
    }

      default:{
        return MaterialPageRoute(builder: (ctx){
          return  const PageNotFound();
        });}
    }
  }
}
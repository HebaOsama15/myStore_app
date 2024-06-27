
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


  //   case '/route_in_map':{
  //     return MaterialPageRoute(builder: (ctx){
  //       return  const RoutesInMap();
  //     });
  //   }


      default:{
        return MaterialPageRoute(builder: (ctx){
          return  const PageNotFound();
        });}
    }
  }
}

import 'package:e_commesce_app/core/feature/view/pages/detial_product.dart';
import 'package:e_commesce_app/core/feature/view/pages/products_of_category_page.dart';
import 'package:e_commesce_app/core/feature/viewmodel/product_view_model.dart';
import 'package:e_commesce_app/core/feature/viewmodel/user_veiw_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/component/theme_app/theme_app.dart';
import 'core/feature/viewmodel/cart_model_view.dart';
import 'core/feature/viewmodel/favorate_view_model.dart';
import 'core/feature/viewmodel/product_cart_model_view.dart';
import 'core/functions/loading_state.dart';
import 'helper/shared_refrene_healper.dart';
import 'route_management.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
 await SharedPrefsHelper.init();
 
runApp(const MyApp());

}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: 
    [
  ChangeNotifierProvider(create: (ctx)=>LoginState()),
  ChangeNotifierProvider(create: (ctx)=>UserViewModel()),
  ChangeNotifierProvider(create: (ctx)=>ProdictViewModel()),
  ChangeNotifierProvider(create: (ctx)=>FavorateModelView()),
  ChangeNotifierProvider(create: (ctx)=>CartViewModel()),
  // ChangeNotifierProvider(create: (ctx)=>ProductCartViewModel()),
    ]
    
     ,child:

     const EntryApp()
     );
  }
}

class EntryApp extends StatelessWidget {
  const EntryApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(  
      
   theme: heba_light,   
     debugShowCheckedModeBanner: false,

      routes: {
    '/detial_product': (context) => const DetialProduct(),
    // '/products_of_category': (context) =>  ProductOfCategoryPage(),
    // '/booking_detial': (context) => MyBookingDetialPage(),
    // '/booking_user' :(context) => const BookingUserPage(),
  },
      // home:const HomePage(),
       initialRoute: '/',
      
     onGenerateRoute: 
     RouteManager.generateRoute, 
    );
  }
}

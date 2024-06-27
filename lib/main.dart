
import 'package:e_commesce_app/core/feature/viewmodel/product_view_model.dart';
import 'package:e_commesce_app/core/feature/viewmodel/user_veiw_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'core/component/theme_app/theme_app.dart';
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
      locale:const Locale('ar', 'AR'),
      localizationsDelegates:const  [
    GlobalCupertinoLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ],
  supportedLocales: const [
    Locale('ar', 'AR'),
    Locale('en', ''),
  ],
   theme: heba_light,   
     debugShowCheckedModeBanner: false,

      routes: {
    // '/trip_detial': (context) => TripDetialPage(),
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

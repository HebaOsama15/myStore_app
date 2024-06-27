import 'package:e_commesce_app/core/constants/colors.dart';
import 'package:flutter/material.dart';


ThemeData heba_light = ThemeData(
 brightness: Brightness.light,
 primaryColor: primaryColor,
 scaffoldBackgroundColor: primaryColor,


  iconTheme: const IconThemeData(color: Colors.black),
 textTheme:  const TextTheme(
  
  titleLarge: TextStyle(
       fontFamily: "Samim",
       fontWeight: FontWeight.bold,
       fontSize: 22,
       color: Colors.black
     ),
     titleMedium: TextStyle(
       fontFamily: "Samim",
       fontWeight: FontWeight.bold,
       fontSize: 18,
       color: Colors.black
     ),
     titleSmall: TextStyle(
       fontFamily: "Samim",
       fontWeight: FontWeight.bold,
       fontSize: 14,
       color: Colors.black54
     ),
 ),

 elevatedButtonTheme: ElevatedButtonThemeData(
 style:ElevatedButton.styleFrom(
  foregroundColor: Colors.white, backgroundColor: secondColor, // Text color
                           elevation: 5, // Shadow elevation
                           shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(10), // Rounded corners
                           ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10), 
  // backgroundColor: Colors.black,
    
  //    shape:  RoundedRectangleBorder(
  //     borderRadius:BorderRadius.circular(8),
  //      ),
      textStyle:const TextStyle(
         fontFamily: "Samim",
         color: Colors.white,
         fontWeight: FontWeight.bold,
         fontSize: 17,), 
        minimumSize:  const Size(double.infinity , 50), 
    
  ) ),

  appBarTheme:const AppBarTheme(
     elevation: 0,
     toolbarHeight: 80,
     backgroundColor: scaffoldColor
  ),

  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: scaffoldColor,
    shape: RoundedRectangleBorder(
     borderRadius: BorderRadius.circular(15.0),
  ),
  ),

  floatingActionButtonTheme:  FloatingActionButtonThemeData(backgroundColor: secondColor,
  shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            //  side: BorderSide(color: Colors.green[200]!, width: 2.0),
          ),),

  cardTheme: CardTheme(
    // color: kBlueLight,
    shape: RoundedRectangleBorder(
     borderRadius: BorderRadius.circular(15.0),
  ),
  ),

  // inputDecorationTheme: InputDecorationTheme(
  //     // fillColor: kGreenLight,
  //     filled: true,
  //           hintStyle: TextStyle(color: Colors.blueGrey[300],fontWeight: FontWeight.w200, fontSize: 15),
  //           contentPadding:  const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
  //           // enabledBorder: const OutlineInputBorder(
  //           //   borderSide: BorderSide(
  //           //     color: kGreenLight,
  //           //   ),
  //           //   borderRadius: BorderRadius.all(
  //           //     Radius.circular(15),
  //           //   ),
  //           // ),
  //           // focusedBorder: const OutlineInputBorder(
  //           //   borderSide: BorderSide(
  //           //     color:kDarkGreen,
  //           //   ),
  //           //   borderRadius: BorderRadius.all(
  //           //     Radius.circular(10),
  //           //   ),
              
  //           ),
          );
      

  
// );
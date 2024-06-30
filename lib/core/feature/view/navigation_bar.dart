

import 'package:e_commesce_app/core/constants/colors.dart';
import 'package:e_commesce_app/core/feature/view/cart_page.dart';
import 'package:e_commesce_app/core/feature/view/favorate_page.dart';
import 'package:e_commesce_app/core/feature/view/home_page.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import 'profile_page.dart';



class MasterPage extends StatefulWidget {
  const MasterPage({ super.key });

  @override
  State<MasterPage> createState() => _MasterPageState();
}

class _MasterPageState extends State<MasterPage> {
   int selectedScreenIndex = 0;
  List<Map<String,dynamic>>list = 
  [{"home":IconlyLight.home},
   {"cart":IconlyLight.buy},
   {"favorate":IconlyLight.heart},
   {"profile":IconlyLight.profile}];
  @override
  Widget build(BuildContext context) {
    
    List<Widget>screens=[

     HomePage(),
     CartPage(),
     FavoratePage(),
     ProfilePage(),
     
   ];
    return Scaffold(
       body: screens[selectedScreenIndex],

    //  floatingActionButton: FloatingActionButton(onPressed: (){suported(context);},
    //   child: IconButton(icon:const Icon(IconlyBold.calling),onPressed: (){},),),

      bottomNavigationBar: FlashyTabBar(
     selectedIndex: selectedScreenIndex,
     showElevation: true,
     onItemSelected: (index) => setState(() {
       selectedScreenIndex = index;
     }),
     items: 
     List.generate(list.length,((index) {
       final item = list[index]; 
       return FlashyTabBarItem(
          icon: Icon(item.values.first, color: primaryColor,size: 30,),
          title: Text(item.keys.first,style: Theme.of(context).textTheme.titleMedium!.copyWith(color: primaryColor),),
        );
     }))
),
    );
    
  }
}
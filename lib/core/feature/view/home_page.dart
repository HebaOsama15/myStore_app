// ignore_for_file: must_be_immutable

import 'package:e_commesce_app/core/component/widgets/ligon_text_feild.dart';
import 'package:e_commesce_app/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import 'widgets.dart/product_show_sction.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});
  
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // var MediaQueryData = MediaQuery.of(context);
     var size = MediaQuery.of(context).size; 
  
    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2; 
    final double itemWidth = size.width / 2; 
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWeidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.menu)),
        title: Text("الصفحة الرئسية"),
        actions: [IconButton(onPressed: (){}, icon: Icon(IconlyLight.buy))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: ListView(
          children: [
            SizedBox(height: screenHeight * 0.01,),
            Text("جِد ستايلك الخاص", style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white, fontSize: 35),),
            SizedBox(height: screenHeight * 0.04,),
            //TODO: تفاهمي مع ذا بعدين
            LoginTextFeild(controller: searchController , lable: "...ابحث هنا"),
            SizedBox(height: screenHeight * 0.04,),
            ProductShowSection(screenHeight: screenHeight, itemWidth: itemWidth, itemHeight: itemHeight, screenWeidth: screenWeidth)
            


          ],
        ),
      ),
    );
  }
}

// ignore_for_file: must_be_immutable

import 'package:e_commesce_app/core/component/widgets/ligon_text_feild.dart';
import 'package:e_commesce_app/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});
  
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // var MediaQueryData = MediaQuery.of(context);
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWeidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
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
            Column(
              children: [
                SizedBox(
                  height: screenHeight,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16.0, 
                      mainAxisSpacing: 16.0, 
                    ),
                    itemCount: 12, // عدد العناصر في الشبكة
                    itemBuilder: (BuildContext context, int index) {
                      //  for (int i = 0; i < length - 1; i++) { // Loop up to length - 1
                      //   result.add((i % 2 == 0) ? 'no' : 'yes');
                      // }
                      return
                       SizedBox(
                        // height: screenHeight * 0.05,
                         
                         child: Column(
                          
                           children: [
                            
                             Container(
                              height: screenHeight * 09,
                              width: screenWeidth,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                 borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                 ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  IconButton(onPressed: (){},
                                   icon: Icon(IconlyLight.heart, color: primaryColor,))
                                ],
                              )
                                                   ),
                              // Text("اسم المنتج"),
                              // Text("20.50 \$")
                           ],
                         ),
                       );
                    },
                  ),
                ),
              ],
            )
            


          ],
        ),
      ),
    );
  }
}
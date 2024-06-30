
import 'package:e_commesce_app/core/component/widgets/custom_container.dart';
import 'package:e_commesce_app/core/feature/viewmodel/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

import '../../../constants/colors.dart';

class ProductShowSection extends StatelessWidget {
  const ProductShowSection({
    super.key,
    required this.screenHeight,
    required this.itemWidth,
    required this.itemHeight,
    required this.screenWeidth,
  });

  final double screenHeight;
  final double itemWidth;
  final double itemHeight;
  final double screenWeidth;

  @override
  Widget build(BuildContext context) {
    ProdictViewModel productProvider = Provider.of<ProdictViewModel>(context);
    return SizedBox(
      height: screenHeight,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: (itemWidth / itemHeight * 1.3), 
          // controller: ScrollController(keepScrollOffset: false), 
          // shrinkWrap: true, 
          crossAxisSpacing: 16.0, 
          mainAxisSpacing: 16.0, 
        ),
        itemCount: productProvider.products.length, // عدد العناصر في الشبكة
        itemBuilder: (BuildContext context, int index) {
          //  for (int i = 0; i < length - 1; i++) { // Loop up to length - 1
          //   result.add((i % 2 == 0) ? 'no' : 'yes');
          // }
          return
           InkWell(
            onTap: (){
             Navigator.pushNamed(context,
                                 '/detial_product',
                                 arguments: {'argument': productProvider.products[index]},);
            },
             child: SizedBox(
              height: screenHeight * 0.09,
               child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Expanded(
                    flex: 10,
                     child: CustomDownContainer(width: screenWeidth, height: screenHeight, image: productProvider.products[index].image,),
                   ),
                    Expanded(
                      flex: 2,
                      child: Text(productProvider.products[index].title??"")),
                    Expanded(
                      flex: 2,
                      child: Text("${productProvider.products[index].price} \$"))
                 ],
               ),
             ),
           );
        },
      ),
    );
  }
}

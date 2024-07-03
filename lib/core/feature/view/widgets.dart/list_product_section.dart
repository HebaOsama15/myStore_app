
import 'package:e_commesce_app/core/component/widgets/custom_container.dart';
import 'package:e_commesce_app/core/feature/model/product_info_model.dart/product.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class ListProductSection extends StatelessWidget {
  const ListProductSection({
    super.key,
    required this.productList,
  });

  final List<Product> productList;

  @override
  Widget build(BuildContext context) {
    return Container(
     padding: EdgeInsets.only(top:10, right: 10,left: 10,bottom: 50),
     // margin: EdgeInsets.only(left:15, right: 15,  bottom: 20),
     height: MediaQuery.of(context).size.height,
     width: MediaQuery.of(context).size.width,
     decoration: BoxDecoration(
       color: scaffoldColor,
       borderRadius: BorderRadius.circular(20)
     ),
      child: ListView.separated(
       separatorBuilder: (context, index) =>const Padding(
         padding:  EdgeInsets.all(15.0),
         child:  Divider(
           thickness: 1.5,
             color: Colors.black38,
           ),
       ),
       // itemExtent: 100.0,
       itemCount:
        productList.length,
       itemBuilder: (ctx, index){
         
       return ListTile(
         onTap: (){
           Navigator.pushNamed(
               context,
               '/detial_product',
               arguments: {'argument': productList[index]},
             );
         },
        leading:CustomDownContainer(
                         width: 60,
                         height: MediaQuery.of(context).size.height,
                         isImage: true,
                         image: productList[index].image,
                         
                       ), 
         title: Flexible(
                             fit: FlexFit.tight,
                             child: Text(
                               productList[index].title??"",
                               style: Theme.of(context)
                                   .textTheme
                                   .titleMedium!
                                   .copyWith(color: Colors.black87),
                                   softWrap: true,
                                   overflow: TextOverflow.ellipsis,
                                   maxLines: 2,
                             ),
                           ), 
         subtitle: Text(
                             '${productList[index].price}\$',
                             style: Theme.of(context)
                                 .textTheme
                                 .titleSmall!
                                 .copyWith(color: Colors.black54),
                           ),
       );
      }),
    );
  }
}

import 'package:e_commesce_app/core/feature/viewmodel/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../constants/colors.dart';

class CustomDownContainer extends StatelessWidget {
   CustomDownContainer({
    super.key,
    this.image,
    this.isImage = true,
    required this.width,
    required this.height,
  });

  String? image;
  bool isImage;
  double width;
  double height;

  @override
  Widget build(BuildContext context) {
    return Container(
     
       height: height,
       width: width,
       decoration:isImage? BoxDecoration(
         image: DecorationImage(
         image: NetworkImage(image!),
         fit: BoxFit.contain,
       ),
         color: Colors.white,
          borderRadius:const BorderRadius.only(
           topLeft: Radius.circular(20),
           topRight: Radius.circular(20),
          ),
       ):null ,
      //  
       child: Column(
         mainAxisAlignment: MainAxisAlignment.start,
         crossAxisAlignment: CrossAxisAlignment.end,
         children: [
           IconButton(onPressed: (){},
            icon:const Icon(IconlyLight.heart, color: primaryColor,))
         ],
       )
                            );
  }
}
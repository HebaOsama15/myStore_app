
import 'package:flutter/material.dart';

class CustomDownContainer extends StatelessWidget {
   CustomDownContainer({
    super.key,
    this.image,
    this.isImage = true,
    required this.width,
    required this.height,
    this.child,
    this.borderRadius,
  });

  String? image;
  bool isImage;
  double width;
  double height;
  Widget? child;
  BorderRadiusGeometry? borderRadius;

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
          borderRadius:borderRadius?? const BorderRadius.only(
           topLeft: Radius.circular(20),
           topRight: Radius.circular(20),
          ),
       ):null ,
      //  
       child: child
                            );
  }
}
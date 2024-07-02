
  import 'package:e_commesce_app/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

AppBar cartAppBar(BuildContext context, int cartCount) {
    return AppBar(
      title: Text('Your Cart', 
      style: Theme.of(context).textTheme.titleLarge!.copyWith(color: primaryColor, fontSize: 30),),
      actions:  [
        Padding(
          padding:const EdgeInsets.only(right:25.0),
          child: Badge(
            backgroundColor: primaryColor,
           label: Text(cartCount.toString()),
            child:const Icon(IconlyLight.buy, color: primaryColor,size: 30,)),
        )
      ],
      leading: Container(),
    );
}